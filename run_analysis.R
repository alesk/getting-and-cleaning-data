NROWS<-8000

features.raw <- read.table("./data/features.txt", header=F, col.names=c("index", "name"))
features.uniqe <- sprintf("%3d.%s", features.raw$index, features.raw$name)    
features.of.interest <- features[grep("\\-mean\\(|\\-std\\(", features)]
renamed.features <- features.of.interest
renamed.features <- gsub("^\\d{1,3}\\.", "", renamed.features)
renamed.features <- gsub("\\-mean\\(\\)", "Mean", renamed.features)
renamed.features <- gsub("\\-std\\(\\)", "Std", renamed.features)
renamed.features <- gsub("\\-X", "X", renamed.features)
renamed.features <- gsub("\\-Y", "Y", renamed.features)
renamed.features <- gsub("\\-Z", "Z", renamed.features)
renamed.features <- gsub("BodyBody", "Body", renamed.features)

    
activity_labels <- read.table("./data/activity_labels.txt", col.names=c("index", "name"))$name


read_data <- function(subjects.file, activities.file, data.file) {
    subjects <- read.table(subjects.file, nrows=NROWS, col.names="subject")
    activities <- factor(
        read.table(activities.file, nrows=NROWS, col.names="activity")$activity, 
        labels=activity_labels)
    data <- read.table(data.file, header=F, col.names=features.uniqe, nrows=NROWS)
    data <- subset(data, select=features.of.interest)    
    names(data) <- renamed.features
    cbind(data, subject=subjects, activity=activities)
}


training.data <- read_data(
    "./data/train/subject_train.txt", 
    "./data/train/y_train.txt", 
    "./data/train/X_train.txt"
    )

test.data <- read_data(
    "./data/test/subject_test.txt",
    "./data/test/y_test.txt",
    "./data/test/X_test.txt"
    )

merged.data = rbind(training.data, test.data)

# create a tidy dataset from merged training and test data aggregated by subject and activity
tidy <- aggregate(.~subject+activity, merged.data, mean)

tidy_ordered <- tidy[with(tidy, order(subject, activity)), ]

write.table(tidy_ordered, "tidy.txt", row.name=FALSE)

# create template for codebook
#capture.output(str(tidy_ordered), file="codebook.md")


codebook <- data.frame()
for (name in names(tidy_ordered)) {
    class <- class(tidy_ordered[1,name])
    if (class == "numeric") {
        data <- tidy_ordered[, name]
        quantiles <- quantile(data)
        codebook <- rbind(codebook, data.frame(
            name=name,
            type="numeric",
            min=round(min(data), 3),
            Q1=round(quantiles[2], 3),
            median=round(quantiles[3], 3),
            Q3=round(quantiles[4], 3),
            mean=round(mean(data), 3),
            std=round(sd(data), 3),
            max=round(max(data), 3)
        ))        
    }
}

write.table(codebook, "codebook.md", sep="|", row.names=F)

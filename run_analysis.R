# This global variable controls how many data rows gets imported.
# During development it was set to 200.
NROWS<-8000

# read feature names
features.raw <- read.table("./data/features.txt", header=F, col.names=c("index", "name"))

# some names are not unique so add column index to make them uniq
features.uniqe <- sprintf("%3d.%s", features.raw$index, features.raw$name)    

# As we are interested only in mean and standard deviation data,
# make list of thi features to later filter out all other data.
features.of.interest <- features[grep("\\-mean\\(|\\-std\\(", features)]

# Fix some feature naming inconsistencies ad errors
renamed.features <- features.of.interest
renamed.features <- gsub("^\\d{1,3}\\.", "", renamed.features)
renamed.features <- gsub("\\-mean\\(\\)", "Mean", renamed.features)
renamed.features <- gsub("\\-std\\(\\)", "Std", renamed.features)
renamed.features <- gsub("\\-X", "X", renamed.features)
renamed.features <- gsub("\\-Y", "Y", renamed.features)
renamed.features <- gsub("\\-Z", "Z", renamed.features)
renamed.features <- gsub("BodyBody", "Body", renamed.features)

    
# Prepare activity labels to label factored activiy during data import
activity_labels <- read.table("./data/activity_labels.txt", col.names=c("index", "name"))$name

# Common function to read and merge subjects, activites and measurements data
# from training or test datasets.

read_data <- function(subjects.file, activities.file, data.file) {
    subjects <- read.table(subjects.file, nrows=NROWS, col.names="subject")

    activities <- factor(
        read.table(activities.file, nrows=NROWS, col.names="activity")$activity, 
        labels=activity_labels)

    data <- read.table(data.file, header=F, col.names=features.uniqe, nrows=NROWS)
    data <- subset(data, select=features.of.interest)    
    names(data) <- renamed.features

    # make sure to bind smaller data frames to larger one for
    # performance reasons
    cbind(data, subject=subjects, activity=activities)
}


# read and merge training and test data

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


# prepare template file for writing code book.

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

write.table(codebook, "codebook.md.tpl", sep="|", row.names=F)

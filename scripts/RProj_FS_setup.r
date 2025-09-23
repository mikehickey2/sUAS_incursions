##Standard R Project File Structure Setup

file.create("README.md")

dir.names <- c("data", "scripts", "reports", "output")

create_project_dirs <- function(dir.names) {
  if (!is.character(dir.names)) {
    stop("Input must be a vector of character strings.")
  }
  
  for (dir in dir.names) {
    dir.create(dir)
    cat("Created directory:", dir, "\n")
  }
}
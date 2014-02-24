# Setup
set.seed(1337)
dir.create(
    file.path("images", "mean", "002"),
    recursive = TRUE,
    showWarnings = FALSE
)

# Renders a plot that shows how the sample mean and medians are changed by 
# perturbing a single observation
pdf(file.path("images", "mean", "002", "001.pdf"), height = 4)

old_par <- par(mar=c(2.2, 1, 1, 1))
x <- rnorm(6, 0)
plot(x, rep(0, length(x)), yaxt="n", ylim=c(0, 4), xlim=c(-2, 18), xlab="", ylab="", bty="n")
points(mean(x), -0.1, col="red", pch=19)
points(median(x), -0.1, col="blue", pch=19)

for(i in 1:4) {
  x[which.max(x)] <- x[which.max(x)] + 4
  points(x, rep(i, length(x)))
  points(mean(x), i-0.1, col="red", pch=19)
  points(median(x), i-0.1, col="blue", pch=19)
}
legend("bottomright", c("sample mean", "sample median"), col=c("red", "blue"), pch=19)
par(old_par)

dev.off()



# Setup
set.seed(1)

dir.create(
    file.path("images", "median", "003"),
    recursive = TRUE,
    showWarnings = FALSE
)

# Estimate sampling distributions
sampler <- function(t) {
    x <- rexp(1, 1 / t)
    return(c(runif(99), x + 10))
}

n_simulations <- 100000
medians1 <- rep(NA, n_simulations)
medians1000 <- rep(NA, n_simulations)
means1 <- rep(NA, n_simulations)
means1000 <- rep(NA, n_simulations)
for (sim in 1:n_simulations) {
    y1 <- sampler(1)
    y1000 <- sampler(1000)
    medians1[sim] <- median(y1)
    medians1000[sim] <- median(y1000)
    means1[sim] <- mean(y1)
    means1000[sim] <- mean(y1000)
}

# Render sampling distributions
pdf(file.path("images", "median", "003", "001.pdf"))
hist(medians1, main = "")
dev.off()

pdf(file.path("images", "median", "003", "002.pdf"))
hist(medians1000, main = "")
dev.off()

pdf(file.path("images", "median", "003", "003.pdf"))
hist(means1, main = "")
dev.off()

pdf(file.path("images", "median", "003", "004.pdf"))
hist(means1000, main = "")
dev.off()

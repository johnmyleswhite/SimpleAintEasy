# Setup
set.seed(1)

dir.create(
    file.path("images", "median", "001"),
    recursive = TRUE,
    showWarnings = FALSE
)

# Render density function
mypdf <- function(x) {
    return(0.5 * dnorm(x, mean = -5.0, sd = 1.0) +
           0.5 * dnorm(x, mean = +5.0, sd = 1.0))
}

pdf(file.path("images", "median", "001", "001.pdf"))
curve(mypdf, from = -10, to = +10)
dev.off()

# Estimate sampling distributions
sampler <- function(N) {
    mu <- c(-5.0, +5.0)
    z <- rbinom(N, 1, 0.5)
    return(rnorm(N, mean = mu[z + 1], sd = 1.0))
}

sample_size <- 1000
n_simulations <- 1000000
medians <- rep(NA, n_simulations)
means <- rep(NA, n_simulations)
for (sim in 1:n_simulations) {
    x <- sampler(sample_size)
    medians[sim] <- median(x)
    means[sim] <- mean(x)
}

# Render sampling distributions
pdf(file.path("images", "median", "001", "002.pdf"))
hist(medians, main = "")
dev.off()

pdf(file.path("images", "median", "001", "003.pdf"))
hist(means, main = "")
dev.off()

# Prepare sampling distribution variability table
sd(medians)
sd(means)

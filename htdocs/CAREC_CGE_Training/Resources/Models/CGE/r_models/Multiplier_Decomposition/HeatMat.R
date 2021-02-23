require(fields)
# Make a 10x10 matrix
m = matrix(rnorm(100), nrow=10)
image.plot(m)
for (x in 1:10)
    for (y in 1:10)
        text((x-1)/9, (y-1)/9, sprintf("%0.2f", m[x,y]))

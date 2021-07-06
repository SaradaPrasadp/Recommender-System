library(recommenderlab)
library(reshape2)



                                    #Entertainment



Entertainment <- read.csv(file.choose())


#we have to convert this into matrix form.

Entertainment1 <- as.matrix(acast(Entertainment , ï..Id~Titles ,fun.aggregate = mean))

#now we'll make in  realrating matrix format.
E <- as(Entertainment1, "realRatingMatrix")

# we'll use User-based collaborative filtering.


rec2 = Recommender(E , method="POPULAR")


# create n recommendations for a user
uid ="1123"
genre <- subset(Entertainment, Entertainment$Category==uid)
genre


 
prediction <- predict(rec2, E[uid], n=2)
as(prediction, "list")

#so we can suggest movie to the user as they preferable genre.


#like that we can suggest different genre movie to different customer.







                                      #Game DVD



Game <- read.csv(file.choose())

#we'll take only some data, because it's too difficult to take all

Game <- Game[1:400,]

#we have to convert this into matrix form.

Game1 <- as.matrix(acast(Game , userId~game ,fun.aggregate = mean))

#now we'll make in  realrating matrix format to do this recommendation.
G <- as(Game1, "realRatingMatrix")

# we'll use User-based collaborative filtering.

rec = Recommender(binarize(R, minRating = 2) , method="UBCF")## User-based collaborative filtering


## create n recommendations for a user
uid = "54"
gamename <- subset(Game, Game$userId==uid)

gamename
prediction <- predict(rec, G[uid], n=2)

#so we can suggest games to the customer like this for various customer.

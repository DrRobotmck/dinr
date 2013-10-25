#din.r

****
###"to dine or not to dine, that is the question. *din.r* is the answer"

****

din.r is the first full rails app that I worked on for General Assembly's Web Development Immersive course. The purpose of creating **din.r** was to take a little bit of the guesswork out of choosing a restaurant to eat at. Just viewing a restaurant's grade gives no real insight into the actual points of the inspection, which is what really matters. To solve this issue, I used a standardized point system to color-code and label roughly 700 restaurants centered around General Assembly's main campus in the Flatiron area of NYC. The restaurants were then separated into 3 categories: The Good, the Bad, and the Ugly.

###The Process
****

I started out by taking the inspection data for all restaurants in NYC provided through their **NYCOpenData** initiative for the last 3 years, roughly **550000** lines of data, organized it, labeled it, extracted the pertinent information, and whittled it down to the last 6 months worth of inspections in 3 zip codes surrounding General Assembly. Using Google's **Fusion Table API**, I was able to map each of the individual data points for the restaurant's, along with labels indicating the location, grade received on their last inspection, and the number of points received on that inspection. Each restaurant is listed below the main map and links to an individual page with a more specific map using Google's **Static Map API**, and more information about the restaurant (phone number, address, date of inspection, etc.).

Users are able to create their own accounts where they are able to save a list of restaurants as favorites and change/update/delete their user information.

#####Take a look...

<http://dinr.herokuapp.com>

####Contact
****
McKenneth Scott III | mckenneth.scott@icloud.com
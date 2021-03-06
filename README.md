Slides for [my talk](http://iaglr.org/conference/abstracts/pub_sesspres_view.php?session_id=4) at IAGLR 2015. [View slide deck.](http://karawoo.com/IAGLR2015/woo_underice_iaglr_2015.html)

## Abstract

### Data Management and Building Community in a Global Synthesis of Under-Ice Productivity

Kara H. Woo, Stephanie E. Hampton, Aaron W.E. Galloway

Interest in winter limnology has increased in recent years, yet still relatively
little is known about ecological dynamics under ice in seasonally frozen
lakes. A synthesis project is underway to examine these dynamics using data
collected from global researchers. Challenges for syntheses involving
geographically distributed colleagues include integrating heterogeneous data,
managing communications from inception to conclusion, and building a sense of
community. We describe techniques we used to integrate and manage data
throughout each stage of the project, beginning with the early step of gauging
interest from 120 researchers using an online survey. We used these survey
results to tailor our subsequent request for ecological data, which was
accompanied by policies on data sharing and collaboration for prospective
collaborators. Our data entry template was designed to make data comparable
across systems while both minimizing the effort of combining researchers' data
into one data set and reducing potential anxiety about data sharing.
Additionally we developed an R software package to automate data quality
assurance. Project files and analyses are hosted on a website to which
collaborators have access, with clear expectations for access and use, and the
data will ultimately be published in an open access data repository.

## Building these files

I am using [Slidify](https://github.com/ramnathv/slidify) to write this
presentation. `slidify("woo_underice_iaglr_2015.Rmd")` will create HTML slides.
There's a makefile to create HTML and PDF slides simultaneously (`make all`);
the PDF generation was adapted from
[this gist](https://gist.github.com/ramnathv/8700285) with some tweaks to the
slide size. PhantomJS and CasperJS are required to build the PDF. I followed
[these instructions](https://gist.github.com/julionc/7476620) to install
PhantomJS. To install CasperJS on Ubuntu 14.04:

```
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
sudo npm install -g casperjs
```

The makefile also copies the PDF to a new file with the name format required by
IAGLR (dayofmonth_room_time_surname); this is `.gitignore`ed.

### Note:

I have downgraded the `stringr` package to v. 0.6.2 for building these slides.
See [this thread](https://github.com/ramnathv/slidify/issues/407).

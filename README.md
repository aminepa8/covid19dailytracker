"# covid19dailytracker" 

### Add another country

Go to file lib/pages/choose_location , and add the line below to the locations array 

```
Country(url: 'morocco', location: 'Morocco', flag: 'morocco.png'),

```
make sure to test the url in the api link in your browser , to avoid any issue with typo or spelling.
```
'https://api.covid19api.com/country/$url'
```

* [COVID19API](https://api.covid19api.com) - The API used

## App ScreeShots

<div>
<div  align="left" >
<h4> Loading ThreeBounce Animation </h4>
<img alt="Screenshot app" src="https://raw.githubusercontent.com/aminepa8/covid19dailytracker/master/screenLoading.png">
</div>
<div align="right" >
<h4> Main Screen </h4>
<img  alt="Screenshot app" src="https://raw.githubusercontent.com/aminepa8/covid19dailytracker/master/screen2.png">
</div>
</div>
<div> 
<div align="left">
<h4> Choose Location Screen </h4>
<img   alt="Screenshot app" src="https://raw.githubusercontent.com/aminepa8/covid19dailytracker/master/screen3.png">
</div>
</div>

## Acknowledgments

* background image by Clay banks
* Inspiration the net ninja
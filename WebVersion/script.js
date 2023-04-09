const form = document.querySelector('#proxy-form');

const accessKey = 'afd8c877c16bbb9da45e20b2edc90ea3'; // replace with your ipstack access key

form.addEventListener('submit', function(event) {
    event.preventDefault(); // prevent the form from submitting normally
  
    const ip = document.getElementById('text-input').value;
    // console.log(`IP: ${ip}`);

    const url = `http://api.ipstack.com/${ip}?access_key=${accessKey}`;

    fetch(url)
    .then(response => response.json())
    .then(data => {
        console.log(data);
        document.getElementById('ip').innerHTML             = 'IP: ' + data.ip;
        document.getElementById('type').innerHTML           = 'Type:  ' + data.type;
        document.getElementById('continent_code').innerHTML = 'Continent code:   ' +  data.continent_code;
        document.getElementById('continent').innerHTML      = 'Continent Name:   ' + data.continent_name;
        document.getElementById('country_code').innerHTML   = 'Country code:   ' + data.country_code;
        document.getElementById('country').innerHTML        = 'Country:   ' + data.country_name;
        document.getElementById('region_code').innerHTML    = 'Region Code:  ' + data.region_code;
        document.getElementById('region').innerHTML         = 'Region: ' + data.region_name;
        document.getElementById('city').innerHTML           = 'City: ' + data.city;
        document.getElementById('zip').innerHTML            = 'Zip: ' + data.zip;
        document.getElementById('latitude').innerHTML       = 'Latitude: ' + data.latitude;
        document.getElementById('longitude').innerHTML      = 'Longitude: ' + data.longitude;

        
    })
    .catch(error => console.error(error));
  
});

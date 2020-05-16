import consumer from "./consumer"

consumer.subscriptions.create("WeatherChannel", {
  connected() {
  },

  disconnected() {
  },

  received(data) {
    var updated_data = data.weather_data;
    var unixTime = updated_data['currently']['time'];
    var date = new Date(unixTime * 1000);

    $('.info-summary')[0].innerHTML = updated_data['hourly']['summary'];
    $('.update-time-value')[0].innerHTML = formatAMPM(date);

    for (var obj of Object.entries(updated_data['currently']) ) {
      if ($(`.${obj[0]}-value`).length > 0) {
        if ($(`.${obj[0]}`)[0].innerText.slice(-1) === "%") {
          $(`.${obj[0]}-value`)[0].innerHTML = obj[1]*100;
        } else {
          $(`.${obj[0]}-value`)[0].innerHTML = obj[1];
        };
      };
    };
    console.log('Weather Updated at:', formatAMPM(date));
  }
});

function formatAMPM(date) {
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var ampm = hours >= 12 ? 'pm' : 'am';
  hours = hours % 12;
  hours = hours ? hours : 12; // the hour '0' should be '12'
  minutes = minutes < 10 ? '0'+minutes : minutes;
  var strTime = hours + ':' + minutes + ' ' + ampm;
  return strTime;
}

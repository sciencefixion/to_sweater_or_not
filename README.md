# To Sweater, Or Not

Project Description

This is the back end of a fictional app that will allow users to plan road trips and see the current weather as well as the forecasted weather at the destination.

This app exposes an API that satisfies the fictional front-end team’s requirements.

## Learning Goals

* Expose an API that aggregates data from multiple external APIs
* Expose an API that requires an authentication token
* Expose an API for CRUD functionality
* Determine completion criteria based on the needs of other developers
* Research, select, and consume an API based on your needs as a developer

## Setup

* Made with Ruby version 2.5.3

* Usage Requirements

 Sign up for the API keys required to use this app at the web addresses below.

 MapQuest API: https://developer.mapquest.com
 OpenWeather API: https://openweathermap.org/api
 DeepAI Text To Image API: https://deepai.org/machine-learning-model/text2img

* Configuration

Run `bundle install`

Run `bundle exec figaro install`

Add API keys to the newly created application.yml file

* Database creation

`rails db:create`

* Database initialization

`rails db:migrate`

* How to run the test suite

`bundle exec rspec`

* Deployment instructions

`rails s`

## Endpoints

### Retrieve weather for a city

`GET /api/v1/forecast?location=denver,co`

* Example response:

```
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "id": null,
            "timezone": "America/Denver",
            "current": {
                "dt": 1600846503,
                "sunrise": 1600865338,
                "sunset": 1600908912,
                "temp": 287.65,
                "feels_like": 283.69,
                "humidity": 47,
                "uvi": 7.24,
                "visibility": 10000,
                "weather": [
                    {
                        "id": 801,
                        "main": "Clouds",
                        "description": "few clouds",
                        "icon": "02n"
                    }
                ]
            },
            "hourly": [
                {
                    "dt": 1600844400,
                    "temp": 287.65,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02n"
                        }
                    ]
                },
                {
                    "dt": 1600848000,
                    "temp": 290.84,
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04n"
                        }
                    ]
                },
                {
                    "dt": 1600851600,
                    "temp": 292.55,
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04n"
                        }
                    ]
                },
                {
                    "dt": 1600855200,
                    "temp": 293.12,
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04n"
                        }
                    ]
                },
                {
                    "dt": 1600858800,
                    "temp": 293.16,
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04n"
                        }
                    ]
                },
                {
                    "dt": 1600862400,
                    "temp": 292.92,
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04n"
                        }
                    ]
                },
                {
                    "dt": 1600866000,
                    "temp": 292.54,
                    "weather": [
                        {
                            "id": 802,
                            "main": "Clouds",
                            "description": "scattered clouds",
                            "icon": "03d"
                        }
                    ]
                },
                {
                    "dt": 1600869600,
                    "temp": 293.37,
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04d"
                        }
                    ]
                },
                {
                    "dt": 1600873200,
                    "temp": 295.41,
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04d"
                        }
                    ]
                },
                {
                    "dt": 1600876800,
                    "temp": 297.77,
                    "weather": [
                        {
                            "id": 802,
                            "main": "Clouds",
                            "description": "scattered clouds",
                            "icon": "03d"
                        }
                    ]
                },
                {
                    "dt": 1600880400,
                    "temp": 299.5,
                    "weather": [
                        {
                            "id": 802,
                            "main": "Clouds",
                            "description": "scattered clouds",
                            "icon": "03d"
                        }
                    ]
                },
                {
                    "dt": 1600884000,
                    "temp": 300.71,
                    "weather": [
                        {
                            "id": 802,
                            "main": "Clouds",
                            "description": "scattered clouds",
                            "icon": "03d"
                        }
                    ]
                },
                {
                    "dt": 1600887600,
                    "temp": 301.41,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01d"
                        }
                    ]
                },
                {
                    "dt": 1600891200,
                    "temp": 301.93,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01d"
                        }
                    ]
                },
                {
                    "dt": 1600894800,
                    "temp": 302.3,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01d"
                        }
                    ]
                },
                {
                    "dt": 1600898400,
                    "temp": 302.38,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01d"
                        }
                    ]
                },
                {
                    "dt": 1600902000,
                    "temp": 302.14,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02d"
                        }
                    ]
                },
                {
                    "dt": 1600905600,
                    "temp": 301.63,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02d"
                        }
                    ]
                },
                {
                    "dt": 1600909200,
                    "temp": 300.24,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02n"
                        }
                    ]
                },
                {
                    "dt": 1600912800,
                    "temp": 299.51,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1600916400,
                    "temp": 298.47,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02n"
                        }
                    ]
                },
                {
                    "dt": 1600920000,
                    "temp": 297.34,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02n"
                        }
                    ]
                },
                {
                    "dt": 1600923600,
                    "temp": 296.52,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02n"
                        }
                    ]
                },
                {
                    "dt": 1600927200,
                    "temp": 295.62,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02n"
                        }
                    ]
                },
                {
                    "dt": 1600930800,
                    "temp": 294.8,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1600934400,
                    "temp": 294.29,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1600938000,
                    "temp": 293.88,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1600941600,
                    "temp": 293.25,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1600945200,
                    "temp": 292.88,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1600948800,
                    "temp": 292.51,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1600952400,
                    "temp": 292.22,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01d"
                        }
                    ]
                },
                {
                    "dt": 1600956000,
                    "temp": 292.99,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01d"
                        }
                    ]
                },
                {
                    "dt": 1600959600,
                    "temp": 294.92,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01d"
                        }
                    ]
                },
                {
                    "dt": 1600963200,
                    "temp": 297.64,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01d"
                        }
                    ]
                },
                {
                    "dt": 1600966800,
                    "temp": 299.94,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01d"
                        }
                    ]
                },
                {
                    "dt": 1600970400,
                    "temp": 301.61,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02d"
                        }
                    ]
                },
                {
                    "dt": 1600974000,
                    "temp": 303.04,
                    "weather": [
                        {
                            "id": 803,
                            "main": "Clouds",
                            "description": "broken clouds",
                            "icon": "04d"
                        }
                    ]
                },
                {
                    "dt": 1600977600,
                    "temp": 303.91,
                    "weather": [
                        {
                            "id": 802,
                            "main": "Clouds",
                            "description": "scattered clouds",
                            "icon": "03d"
                        }
                    ]
                },
                {
                    "dt": 1600981200,
                    "temp": 304.25,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02d"
                        }
                    ]
                },
                {
                    "dt": 1600984800,
                    "temp": 304.43,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02d"
                        }
                    ]
                },
                {
                    "dt": 1600988400,
                    "temp": 304.23,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02d"
                        }
                    ]
                },
                {
                    "dt": 1600992000,
                    "temp": 303.17,
                    "weather": [
                        {
                            "id": 801,
                            "main": "Clouds",
                            "description": "few clouds",
                            "icon": "02d"
                        }
                    ]
                },
                {
                    "dt": 1600995600,
                    "temp": 300.9,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1600999200,
                    "temp": 299.67,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1601002800,
                    "temp": 298.52,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1601006400,
                    "temp": 297.86,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1601010000,
                    "temp": 297.15,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                },
                {
                    "dt": 1601013600,
                    "temp": 296.44,
                    "weather": [
                        {
                            "id": 800,
                            "main": "Clear",
                            "description": "clear sky",
                            "icon": "01n"
                        }
                    ]
                }
            ],
            "daily": [
                {
                    "dt": 1600884000,
                    "temp": {
                        "min": 287.65,
                        "max": 302.3
                    },
                    "weather": [
                        {
                            "main": "Rain",
                            "icon": "10d"
                        }
                    ],
                    "rain": 0.18
                },
                {
                    "dt": 1600970400,
                    "temp": {
                        "min": 292.51,
                        "max": 304.25
                    },
                    "weather": [
                        {
                            "main": "Clouds",
                            "icon": "02d"
                        }
                    ]
                },
                {
                    "dt": 1601056800,
                    "temp": {
                        "min": 293.73,
                        "max": 305.14
                    },
                    "weather": [
                        {
                            "main": "Clouds",
                            "icon": "03d"
                        }
                    ]
                },
                {
                    "dt": 1601143200,
                    "temp": {
                        "min": 293.49,
                        "max": 303.13
                    },
                    "weather": [
                        {
                            "main": "Clouds",
                            "icon": "04d"
                        }
                    ]
                },
                {
                    "dt": 1601229600,
                    "temp": {
                        "min": 291.95,
                        "max": 301.07
                    },
                    "weather": [
                        {
                            "main": "Clouds",
                            "icon": "02d"
                        }
                    ]
                },
                {
                    "dt": 1601316000,
                    "temp": {
                        "min": 290.92,
                        "max": 304.24
                    },
                    "weather": [
                        {
                            "main": "Clear",
                            "icon": "01d"
                        }
                    ]
                },
                {
                    "dt": 1601402400,
                    "temp": {
                        "min": 284.33,
                        "max": 292.08
                    },
                    "weather": [
                        {
                            "main": "Clouds",
                            "icon": "02d"
                        }
                    ]
                },
                {
                    "dt": 1601488800,
                    "temp": {
                        "min": 283.82,
                        "max": 293.08
                    },
                    "weather": [
                        {
                            "main": "Clear",
                            "icon": "01d"
                        }
                    ]
                }
            ]
        }
    }
}
```


### Background Image for the City

`GET /api/v1/backgrounds?location=denver,co`

* Example response:

```
{
    "data": {
        "id": null,
        "type": "backgrounds",
        "attributes": {
            "id": null,
            "location": "denver,co",
            "image_url": "https://api.deepai.org/job-view-file/f85b2094-49a6-43e0-9829-8543a055cee3/outputs/output.jpg",
            "source": "https://deepai.org/machine-learning-model/text2img"
        }
    }
}
```


### User Registration

`POST /api/v1/users`

* Example response:

```
{
    :data => {
                :id => "380",
              :type => "users",
        :attributes => {
              :email => "walter@sobchak_security.com",
            :api_key => "e0f9e936-8c44-43e8-942f-805d27ad0da7"
        }
    }
}
```


### Login

`POST /api/v1/sessions`

* Example response:

```
{
    :data => {
                :id => "386",
              :type => "users",
        :attributes => {
              :email => "walter@sobchak_security.com",
            :api_key => "36c2c38c-b3ec-426d-9283-fe99b314e7a3"
        }
    }
}
```


### Road Trip

`POST /api/v1/road_trip`

* Example response

```
{
    :data => {
                :id => nil,
              :type => "road_trip",
        :attributes => {
                          :id => nil,
                      :origin => "Denver,CO",
                 :destination => "Pueblo,CO",
                 :travel_time => "01:43:57",
            :arrival_forecast => {
                :temperature => "288.06",
                    :summary => "clear sky"
            }
        }
    }
}
```

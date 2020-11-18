# flutter_app

This is a reworking, using flutter, of the vol android project done using java. It is a demo of a flight booking appp.
However, due to limitations on the number of projects hostable on firebase under the free tier,
this app will only be a demonstration of what is possible and only store data on the device.
Therefore it does not have the full qualities of a flight booking app. The reserved seat will not be
accessible by other users

## Home Screen
<img src=https://github.com/mboyamike/vol_flutter/blob/master/Screenshot_1605688539.png width="200" />

At the home screen, a user is able to select their destination and where they are coming from

## Flights Screen
<img src=https://github.com/mboyamike/vol_flutter/blob/master/Screenshot_1605688554.png width="200" />

At the flights screen, a user is able to select their preferred flight. Ideally, it should fetch the
flights information from a remote source. This demo app uses an auto generated list that is not practical
but is intended to show the concept of a list of flights. Tapping on one takes you to the seats page.

## Seats Screen
<img src=https://github.com/mboyamike/vol_flutter/blob/master/Screenshot_1605688560.png width="200" />

In this page, a user is able to select their preferred seats. A list of seats that are already selected 
by other users is hardcoded in the app. This is different from a practical situation where the list of 
already selected seats would be fetched from the database. After selecting preferred seats, the user 
would click on the book seats button

## Payment page
<img src=https://github.com/mboyamike/vol_flutter/blob/master/Screenshot_1605688568.png width="200" />

This final page is the payments page. It just shows the total costs that one should pay, as well as
having a button that enables payment via a mobile payment solution known as mpesa.

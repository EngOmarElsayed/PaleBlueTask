# PaleBlueTask

## Table of Contents
1. [Introduction](#introduction)
2. [Models](#section-1) 
3. [Network Layer](#section-2)
4. [Bussiness Logic and ViewModel](#section-3)
5. [Dependencies and testablity](#section-4)
6. [Views](#section-5)
   
## Introduction <a name="introduction"></a>
This app was built with some princples in mind to be flexible, easy to change and testable. In the up coming sections I will explain how I did so, 
the order of the sections represents how I built the app, I basically started from the depest part NetworkLayer until I made the way up to the view. Let's get started 🚀

## Models <a name="section-1"></a>
Frist I started to create the data models that represents the json response we are getting from the api, to be able to decode the json file. If we looked at the json response
of the api we will find that the key we are intreseted is called `hits` which contains array of json objects that represent the imageData. So I created `ApiResponse` which contains
a property called `hits` like the json response, it's a type of `[ImageDataFromApi]` which contains `id`, `previewURL` and `user` to reflect the jsone response, with the 
`ApiResponse` type we will be able to decode the response successfully. 

Then I created a `ImageDataDisplay` that represnt the data type that the view displayes, you may ask why we did that why didn't we use `ImageDataFromApi`. We did that
because of two things, first we needed to add a property called `id` but of type `UUID` and to be unique for every image this is needed for the `ForEach` in the view. Because after 
testing I found that some images may contain the same `ImageDataFromApi.id` which is a type of `Int`. Second reason it's a good practice to sperate the type you used for decoding 
api response and the one used for views this to keep our code sperated from each other. Those are all the models we needed to build the app.

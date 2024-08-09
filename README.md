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

## Network Layer <a name="section-2"></a>
While building the network layer I had one goal in mind to make it genric and doesn't depend on anything. So I used one of the packages I built called [GenericNetworkLayer](https://github.com/EngOmarElsayed/GenericNetworkLayer) rather than building it all again 😅. To ensure that we don't depend on the package and to easily be able to change it 
with anything else I built a layer on top of it called `NetworkManger` that conforms to `NetworkMangerProtocol`. it only contains one funcation called `getImages` that returns an array
of `ImageDataFromApi`, at this point we can easily replace the implemntation I used with any other implemntation easily. `getImages` takes `EndPointProtocol` type that contains all the compounts of a url and create the url from them, 1This let's us avoid hard coded strings.

```swift
private let apiKey = "Key"

enum EndPoint {
  case getImages(page: Int)
}

extension EndPoint: EndPointProtocol {
  var scheme: APISchemeType {
    return .https
  }
  
  var host: String? {
    switch self {
    case .getImages:
      return "pixabay.com"
    }
  }
  
  var path: String {
    switch self {
    case .getImages:
      return "/api/"
    }
  }
  
  var queryItems: [URLQueryItem]? {
    switch self {
    case let .getImages(page):
      return [URLQueryItem(name: "key", value: "\(apiKey)"),
              URLQueryItem(name: "q", value: "ball"),
              URLQueryItem(name: "image_type", value: "photo"),
              URLQueryItem(name: "page", value: "\(page)"),
              URLQueryItem(name: "per_page", value: "16")]
    }
  }
  
  var urlRequest: URLRequest? {
    return nil
  }
}

```

## Bussiness Logic and ViewModel <a name="section-3"></a>
Now we have two choose either we make the viewModel communicate directly with NetworkLayer or we can sperate them from each other by creating a middle ground that contains all the 
logic, the best practice is the second choose this is excatly what we did. We created `ImageGridLogic` to contain all the logic for fetching the images, it depend on `NetworkManger` it's instance is injected by our Dependency container (I will explain it in the next section), it also contains a property called `pageNumber` this is related to the pagnation logic for the images, to be able to fetch diffrent images everytime we need to give the api a diffrent number everytime this is handled by the `pageNumber`. `getImages` is used to get the image and return `[ImageDataDisplay]`.


// viewModle and it's property and it testbel and doesn't depend on any implemntation.

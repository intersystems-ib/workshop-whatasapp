# workshop-whatsapp

Example of connectivity between InterSystems IRIS for Health and WhatsApp Endpoint.

You can find more in-depth information in https://learning.intersystems.com.


# What do you need to install?

* [Git](https://git-scm.com/downloads)

* [Docker](https://www.docker.com/products/docker-desktop) (if you are using Windows, make sure you set your Docker installation to use "Linux containers").

* [Docker Compose](https://docs.docker.com/compose/install/)

* [Visual Studio Code](https://code.visualstudio.com/download) + [InterSystems ObjectScript VSCode Extension](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript)


# Setup

Build the image that we will use during the workshop:
  
```console

$ git clone https://github.com/intersystems-ib/workshop-whatsapp
$ cd workshop-whatsapp
$ docker-compose build

```
# Introduction

WhatsApp is a freeware, cross-platform, centralized instant messaging (IM) and voice-over-IP (VoIP) service owned by United States tech conglomerate Meta Platforms. For this example we have created an enterprise account and configure it to work with an IRIS production and allowt it to sent instant messages to an specified phone number.
In order to create and configure our enterprise account we have followed the [official documentation](https://developers.facebook.com/docs/whatsapp/business-management-api/get-started#)

# How to run the container?

Very easy! Just run the following command to start the IRIS instance:

```console
$ docker-compose up -d
```

# What are you going to find in this project?

* An IRIS for Health Community installed and accesible from the [Management Portal](http://localhost:52774/csp/sys/UtilHome.csp) (user: superuser / password: sys).

* A production with:
    * A Business Service configured and ready to read HL7 files from /shared/HL7In folder (HL7_File_In).
    * A Business Process which will get all the required info from the HL7 message by a Data Transformation and send it to the specific Business Operation (From_HL7_To_Message).
    * A Business Operation configured with the following custom parameters (Whatsapp_Message_Out):
        * Version: version of the API used.
        * PhoneNumberId: identifier of the phone number used as sender.
        * Token: authorization token for the HTTP Post call.
* You should update the custom parameters with your own data.

# Attention!

* To run this project you need a Meta account and a project created with WhatsApp capabilities in order to receive POST calls from our InterSystems IRIS for Health production.
Class Whatsapp.BO.WhatsAppBO Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Parameter INVOCATION = "Queue";

Property Version As %String(MAXLEN = 5);

Property PhoneNumberId As %String(MAXLEN = 15);

Property Token As %String(MAXLEN = 1000);

Parameter SETTINGS = "Version,PhoneNumberId,Token";

Method SendMessage(pRequest As Whatsapp.Message.WhatsAppRequest, Output pResponse As Whatsapp.Message.WhatsAppResponse) As %Status
{
    set tSC=$$$OK
    
    set body = {
      "messaging_product": "whatsapp",
      "to": "",
      "type": "template",
      "template": {
          "name": "",
          "language": {
              "code": "en"
          }
      }
    }
    do body.%Set("to", pRequest.telephone)
    do body.template.%Set("name", pRequest.template)
    $$$TRACE(body.%ToJSON())

    set request = ##class(%Net.HttpRequest).%New()
    set request.Authorization = "Bearer "_..Token
        
    set request.ContentType = "application/json"
    set request.Https = 1
    set request.SSLConfiguration="default"
    set request.Location = "/"_..Version_"/"_..PhoneNumberId_"/messages"
    do request.EntityBody.Write(body.%ToJSON())    

    set status = ..Adapter.SendFormData(.response,"POST",request)
    $$$TRACE(response.StatusCode)

    set pResponse = ##class(Whatsapp.Message.WhatsAppResponse).%New()

    Quit tSC
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Whatsapp.Message.WhatsAppRequest">
    <Method>SendMessage</Method>
  </MapItem>
</MapItems>
}

}

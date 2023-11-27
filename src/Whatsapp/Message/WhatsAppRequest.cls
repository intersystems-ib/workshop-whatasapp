Class Whatsapp.Message.WhatsAppRequest Extends (Ens.Request, %XML.Adaptor)
{

Property template As %String;

Property telephone As %String;

Storage Default
{
<Data name="WhatsAppRequestDefaultData">
<Subscript>"WhatsAppRequest"</Subscript>
<Value name="1">
<Value>template</Value>
</Value>
<Value name="2">
<Value>telephone</Value>
</Value>
</Data>
<DefaultData>WhatsAppRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}

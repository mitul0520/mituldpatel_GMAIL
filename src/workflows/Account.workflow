<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Update_Account_Type</fullName>
        <field>Type</field>
        <literalValue>Customer</literalValue>
        <name>Update Account Type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Account_Type_to_Pending</fullName>
        <field>Type</field>
        <literalValue>Pending</literalValue>
        <name>Update Account Type to Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Account_Type_to_Prospect</fullName>
        <field>Type</field>
        <literalValue>Prospect</literalValue>
        <name>Update Account Type to Prospect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Account_Update</fullName>
        <apiVersion>29.0</apiVersion>
        <endpointUrl>http://www.google.com/abc</endpointUrl>
        <fields>AccountNumber</fields>
        <fields>Active__c</fields>
        <fields>BillingCity</fields>
        <fields>BillingCountry</fields>
        <fields>CreatedDate</fields>
        <fields>Id</fields>
        <fields>Phone</fields>
        <fields>Type</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>mituldpatel@gmail.com</integrationUser>
        <name>Account Update</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>Send Account Update</fullName>
        <actions>
            <name>Account_Update</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Active__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>account_name_update</fullName>
        <active>false</active>
        <formula>ISNEW()  || ISCHANGED( Name )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>

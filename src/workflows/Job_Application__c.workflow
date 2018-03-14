<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Send Rejection Letter</fullName>
        <actions>
            <name>Send_Rejection_Letter</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Job_Application__c.Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <description>Send a rejection letter when a hiring manager changes the status of a job application to Rejected</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Send_Rejection_Letter</fullName>
        <assignedToType>owner</assignedToType>
        <description>Send Rejection Letter</description>
        <dueDateOffset>7</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Send Rejection Letter</subject>
    </tasks>
</Workflow>

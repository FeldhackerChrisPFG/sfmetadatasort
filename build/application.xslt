<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:sf="http://soap.sforce.com/2006/04/metadata">
<output method="xml" indent="yes" encoding="UTF-8"/>
<strip-space elements="*"/>

<template match="sf:CustomApplication">
    <copy>
        <apply-templates select="sf:actionOverrides">
            <sort select="sf:actionName"/>
            <sort select="sf:content"/>
            <sort select="sf:formFactor"/>
            <sort select="sf:type"/>
            <sort select="sf:pageOrSobjectType"/>
        </apply-templates>
        <apply-templates select="sf:profileActionOverrides">
            <sort select="sf:actionName"/>
            <sort select="sf:content"/>
            <sort select="sf:formFactor"/>
            <sort select="sf:pageOrSobjectType"/>
            <sort select="sf:recordType"/>
            <sort select="sf:type"/>
            <sort select="sf:profile"/>
        </apply-templates>
        <apply-templates select="*[not(self::sf:actionOverrides) and not(self::sf:profileActionOverrides)]">
        </apply-templates>
        <apply-templates select="@*">
        </apply-templates>
    </copy>
</template>

<template match="node()|@*">
    <copy>
        <apply-templates select="node()|@*"/>
    </copy>
</template>

</stylesheet>
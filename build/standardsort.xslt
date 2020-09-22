<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:sf="http://soap.sforce.com/2006/04/metadata">
<output method="xml" indent="yes" encoding="UTF-8"/>
<strip-space elements="*"/>

<template match="node()|@*">
    <copy>
        <apply-templates select="node()|@*">
            <sort select="name()"/>
            <sort select="@*"/>
        </apply-templates>
    </copy>
</template>

</stylesheet>
<stylesheet version="1.0" xmlns="http://www.w3.org/1999/XSL/Transform" 
    xmlns:sf="http://soap.sforce.com/2006/04/metadata">
<output method="xml" indent="yes" encoding="UTF-8"/>
<strip-space elements="*"/>

<template match="sf:objectMapping">
    <copy>
        <apply-templates select="sf:mappingFields">
            <sort select="sf:inputField"/>
        </apply-templates>
        <apply-templates select="*[not(self::sf:mappingFields)]">
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
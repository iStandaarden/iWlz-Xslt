<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema">

    <!-- iWlz 2.1 CD029 version 1.9.14 (2019-12-02) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CD029"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CD029"/>
    </xsl:template>

    <xsl:template match="aw33:Indicatie" mode="CD029">
	    <xsl:if test="count(./aw33:GeindiceerdeZorgzwaartepakketten/*[aw33:ZzpCode/text() != '999'] | ./aw33:GeindiceerdeFuncties/*) &gt; 0">
	        <xsl:call-template name="checkimplication">
	            <xsl:with-param name="pThis"
	                            select="(./aw33:GeindiceerdeZorgzwaartepakketten/*[aw33:ZzpCode/text() != '999'] | ./aw33:GeindiceerdeFuncties/*)[1]"/>
	            <xsl:with-param name="pValue1">#</xsl:with-param>
	            <xsl:with-param name="pOther" select="./aw33:Grondslagen"/>
	            <xsl:with-param name="pValue2">#</xsl:with-param>
	            <xsl:with-param name="pRule">CD029</xsl:with-param>
	        </xsl:call-template>
	    </xsl:if>
    </xsl:template>

    <xsl:template match="zk31:Indicatie" mode="CD029">
	    <xsl:if test="count(./zk31:GeindiceerdeZorgzwaartepakketten/*[zk31:ZzpCode/text() != '999'] | ./zk31:GeindiceerdeFuncties/*) &gt; 0">
	        <xsl:call-template name="checkimplication">
	            <xsl:with-param name="pThis"
	                            select="(./zk31:GeindiceerdeZorgzwaartepakketten/*[zk31:ZzpCode/text() != '999'] | ./zk31:GeindiceerdeFuncties/*)[1]"/>
	            <xsl:with-param name="pValue1">#</xsl:with-param>
	            <xsl:with-param name="pOther" select="./zk31:Grondslagen"/>
	            <xsl:with-param name="pValue2">#</xsl:with-param>
	            <xsl:with-param name="pRule">CD029</xsl:with-param>
	        </xsl:call-template>
	    </xsl:if>
    </xsl:template>

    <xsl:template match="zk33:Indicatie" mode="CD029">
	    <xsl:if test="count(./zk33:GeindiceerdeZorgzwaartepakketten/*[zk33:ZzpCode/text() != '999'] | ./zk33:GeindiceerdeFuncties/*) &gt; 0">
	        <xsl:call-template name="checkimplication">
	            <xsl:with-param name="pThis"
	                            select="(./zk33:GeindiceerdeZorgzwaartepakketten/*[zk33:ZzpCode/text() != '999'] | ./zk33:GeindiceerdeFuncties/*)[1]"/>
	            <xsl:with-param name="pValue1">#</xsl:with-param>
	            <xsl:with-param name="pOther" select="./zk33:Grondslagen"/>
	            <xsl:with-param name="pValue2">#</xsl:with-param>
	            <xsl:with-param name="pRule">CD029</xsl:with-param>
	        </xsl:call-template>
	    </xsl:if>
    </xsl:template>

    <xsl:template match="io31:Indicatie" mode="CD029">
	    <xsl:if test="count(./io31:GeindiceerdeZorgzwaartepakketten/*[io31:ZzpCode/text() != '999'] | ./io31:GeindiceerdeFuncties/*) &gt; 0">
	        <xsl:call-template name="checkimplication">
	            <xsl:with-param name="pThis"
	                            select="(./io31:GeindiceerdeZorgzwaartepakketten/*[io31:ZzpCode/text() != '999'] | ./io31:GeindiceerdeFuncties/*)[1]"/>
	            <xsl:with-param name="pValue1">#</xsl:with-param>
	            <xsl:with-param name="pOther" select="./io31:Grondslagen"/>
	            <xsl:with-param name="pValue2">#</xsl:with-param>
	            <xsl:with-param name="pRule">CD029</xsl:with-param>
	        </xsl:call-template>
	    </xsl:if>
    </xsl:template>
    
    <xsl:template match="aw317:Indicatie" mode="CD029">
	    <xsl:if test="count(./aw317:GeindiceerdeZorgzwaartepakketten/*[aw317:ZzpCode/text() != '999']) &gt; 0">
	        <xsl:call-template name="checkimplication">
	            <xsl:with-param name="pThis"
	                            select="(./aw317:GeindiceerdeZorgzwaartepakketten/*[aw317:ZzpCode/text() != '999'])[1]"/>
	            <xsl:with-param name="pValue1">#</xsl:with-param>
	            <xsl:with-param name="pOther" select="./aw317:Grondslagen"/>
	            <xsl:with-param name="pValue2">#</xsl:with-param>
	            <xsl:with-param name="pRule">CD029</xsl:with-param>
	        </xsl:call-template>
	    </xsl:if>
    </xsl:template>

</xsl:stylesheet>

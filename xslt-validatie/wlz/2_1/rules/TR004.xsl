<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
>
    <!-- iwlz 2.1 TR004 version 1.9.16 (2019-12-17) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="TR004"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="TR004"/>
    </xsl:template>

    <xsl:template match="aw33:Client" mode="TR004">
        <xsl:call-template name="checkTR004">
            <xsl:with-param name="pNode1" select="aw33:Indicatie/aw33:Afgiftedatum"/>
            <xsl:with-param name="pNode2" select="aw33:Leefeenheid"/>
            <xsl:with-param name="pList" select="aw33:Relaties/aw33:Relatie/aw33:Soort"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Client" mode="TR004">
        <xsl:call-template name="checkTR004">
            <xsl:with-param name="pNode1" select="zk33:Indicatie/zk33:Afgiftedatum"/>
            <xsl:with-param name="pNode2" select="zk33:Leefeenheid"/>
            <xsl:with-param name="pList" select="zk33:Relaties/zk33:Relatie/zk33:Soort"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Client" mode="TR004">
        <xsl:call-template name="checkTR004">
            <xsl:with-param name="pNode1" select="zk31:Indicatie/zk31:Afgiftedatum"/>
            <xsl:with-param name="pNode2" select="zk31:Leefeenheid"/>
            <xsl:with-param name="pList" select="zk31:Relaties/zk31:Relatie/zk31:Soort"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Client" mode="TR004">
        <xsl:call-template name="checkTR004">
            <xsl:with-param name="pNode1" select="io31:Indicatie/io31:Afgiftedatum"/>
            <xsl:with-param name="pNode2" select="io31:Leefeenheid"/>
            <xsl:with-param name="pList" select="io31:Relaties/io31:Relatie/io31:Soort"/>
        </xsl:call-template>
    </xsl:template>


    <xsl:template name="checkTR004">
        <xsl:param name="pNode1"/>
        <xsl:param name="pNode2"/>
        <xsl:param name="pList"/>

        <xsl:variable name="correctOne">
            <xsl:choose>
                <xsl:when test="translate($pNode1, '-', '') > translate('2007-03-01', '-', '')">
                    <xsl:value-of select="true()"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="false()"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="correctTwo">
            <xsl:call-template name="testvalue">
                <xsl:with-param name="pElement" select="$pNode2"/>
                <xsl:with-param name="pValues">3,4</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>

        <xsl:if test="$correctOne = 'true' and $correctTwo = 'true'">
            <xsl:variable name="isInList">
                <xsl:call-template name="inList">
                    <xsl:with-param name="pList" select="$pList"/>
                    <xsl:with-param name="pValue">12</xsl:with-param>
                </xsl:call-template>
            </xsl:variable>

            <xsl:if test="$isInList != 'true'">
                <xsl:call-template name="addError">
                    <xsl:with-param name="pElements" select="$pNode2 | $pList"/>
                    <xsl:with-param name="pRule">TR004</xsl:with-param>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>

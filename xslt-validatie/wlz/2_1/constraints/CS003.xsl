<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:iwlz="http://www.istandaarden.nl/iwlz/2_1/basisschema/schema"
                xmlns:aw33="http://www.istandaarden.nl/iwlz/2_1/aw33/schema"
                xmlns:aw39="http://www.istandaarden.nl/iwlz/2_1/aw39/schema"
                xmlns:aw317="http://www.istandaarden.nl/iwlz/2_1/aw317/schema"
                xmlns:io31="http://www.istandaarden.nl/iwlz/2_1/io31/schema"
                xmlns:zk31="http://www.istandaarden.nl/iwlz/2_1/zk31/schema"
                xmlns:zk33="http://www.istandaarden.nl/iwlz/2_1/zk33/schema"
                xmlns:zk39="http://www.istandaarden.nl/iwlz/2_1/zk39/schema"
>
    <!-- iWlz 2.1 CS003 version 1.9.19 (2020-03-25) -->

    <xsl:import href="../common/basis.xsl"/>
    <xsl:template match="*" mode="CS003"/>
    <xsl:template match="*" mode="check">
        <xsl:apply-templates select="*" mode="CS003"/>
    </xsl:template>

    <!-- AW317 -->

    <xsl:template match="aw317:GeindiceerdZorgzwaartepakket/aw317:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../aw317:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw317:Indicatie/aw317:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../aw317:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- AW33 -->

    <xsl:template match="aw33:Contact/aw33:Periode/iwlz:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../iwlz:Begindatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:GeindiceerdZorgzwaartepakket/aw33:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../aw33:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:GeindiceerdeFunctie/aw33:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../aw33:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:Indicatie/aw33:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../aw33:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenFunctie/aw33:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../aw33:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="aw33:ToegewezenZorgzwaartepakket/aw33:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../aw33:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- AW39 -->

    <xsl:template match="aw39:AanvraagInstelling/aw39:ToewijzingEinddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../aw39:ToewijzingIngangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- IO31 -->

    <xsl:template match="io31:Contact/io31:Periode/iwlz:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../iwlz:Begindatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:GeindiceerdZorgzwaartepakket/io31:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../io31:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:GeindiceerdeFunctie/io31:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../io31:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="io31:Indicatie/io31:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../io31:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- ZK31 -->
     <xsl:template match="zk31:Contact/zk31:Periode/iwlz:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../iwlz:Begindatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="zk31:GeindiceerdZorgzwaartepakket/zk31:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../zk31:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:GeindiceerdeFunctie/zk31:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../zk31:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:Indicatie/zk31:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../zk31:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenFunctie/zk31:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../zk31:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk31:ToegewezenZorgzwaartepakket/zk31:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../zk31:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- ZK33 -->

    <xsl:template match="zk33:Contact/zk33:Periode/iwlz:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../iwlz:Begindatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:GeindiceerdZorgzwaartepakket/zk33:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../zk33:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:GeindiceerdeFunctie/zk33:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../zk33:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:Indicatie/zk33:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../zk33:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenFunctie/zk33:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../zk33:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="zk33:ToegewezenZorgzwaartepakket/zk33:Einddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../zk33:Ingangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <!-- ZK39 -->

    <xsl:template match="zk39:AanvraagInstelling/zk39:ToewijzingEinddatum" mode="CS003">
        <xsl:call-template name="checkafter">
            <xsl:with-param name="pOther" select="../zk39:ToewijzingIngangsdatum"/>
            <xsl:with-param name="pRule">CS003</xsl:with-param>
        </xsl:call-template>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:strip-space elements="*"/>
    <xsl:template match="/">
        <html>
            <head>
               <title>Petit Larousse illustré 1988</title>
                <link rel="stylesheet" type="text/css" href="PTLS_1988.css"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
                <script src="PTLS_1988.js"></script>
            </head>
            <body>
                <div id="menu">
                    <button class="btn">Encyclopedique</button>
                    <button class="btn">Marques</button>
                    <button class="btn">Beaucoup de Motifications</button>
                    <button class="btn">Ajouter Categorisation</button>
                    <button class="btn">Modification la présentation de phonétique et ajoute le numero</button>
                   <!-- <button class="btn" onclick="nouveau()">Nouveau article</button>-->
                </div>
                <div class="row">
                    <h2 class="colum">Petit Larousse illustrée 1988</h2>
                    <h2 class="colum">Petit Larousse illustrée 1980</h2>
                </div>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="comprare_article">
        <div class="row">
            <!--<xsl:attribute name="class">
                <xsl:value-of select="@class"/>
            </xsl:attribute>-->
        <xsl:apply-templates select="article"/>
        </div>
    </xsl:template>
    <xsl:template match="article">  
        <article class="colum">
            <div class="zone_d_identification_etymologique">
            <xsl:if test="ordonnateur_homographe">
                <span class="ordonnateur_homographe">
                    <xsl:value-of select="ordonnateur_homographe"/>
                </span>
                <xsl:text> </xsl:text>
            </xsl:if>
                <xsl:apply-templates select="zone_d_identification_etymologique"/>
            </div>
            <div class="zone_de_traitement">
                <xsl:apply-templates select="zone_de_traitement"/>
            </div>
            <div class="zone_iconographie">
                <xsl:apply-templates select="zone_iconographie"/>
            </div>
        </article>
    </xsl:template>
    <xsl:template match="zone_d_identification_etymologique">
        <span class="composant_d_adressage">
            <xsl:apply-templates select="descendant::composant_d_adressage"/>
        </span>     
        <xsl:if test="composant_transcription_phonetique">
            <span class="composant_transcription_phonetique">
                <xsl:apply-templates select="descendant::composant_transcription_phonetique"/>
             </span>
        </xsl:if>
            <xsl:apply-templates select="descendant::composant_de_categorisation"/>
        <xsl:if test="composant_morphologique">
                <xsl:apply-templates select="descendant::composant_morphologique"/>
        </xsl:if>
        <xsl:if test="composant_d_etymologie">
            <xsl:apply-templates select="descendant::composant_d_etymologie"/>
        </xsl:if>
    </xsl:template>
    <xsl:template match="unite_d_adressage">
        <span class="unite_d_adressage">
            <span class="item_en_adresse">
                <xsl:value-of select="descendant::item_en_adresse"/>
        </span>    
            <xsl:if test="descendant::separateur">
                <xsl:value-of select="descendant::separateur"/>
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:if test="descendant::finale_flexionnelle">
                <span class="finale_flexionnelle">
                    <xsl:value-of select="descendant::finale_flexionnelle"/>
                </span>
                <xsl:text> </xsl:text>
            </xsl:if>
        </span>
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="unite_d_adressage_coordonnee">
        <xsl:if test="preceding-sibling::unite_d_adressage | preceding-sibling::unite_transcription_phonetique |following-sibling::unite_d_adressage_coordonnee">
            <xsl:value-of select="descendant::coordination"/>
            <xsl:text> </xsl:text>
        </xsl:if>
        <span class="unite_d_adressage_coordonnee">
            <span class="item_en_adresse">
                <xsl:value-of select="descendant::item_en_adresse"/>
            </span>
            <xsl:text> </xsl:text>
            <xsl:if test="descendant::separateur">
                <xsl:value-of select="descendant::separateur"/>
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:if test="descendant::finale_flexionnelle">
                <span class="finale_flexionnelle">
                    <xsl:value-of select="descendant::finale_flexionnelle"/>
                </span>
                <xsl:text> </xsl:text>
            </xsl:if>
        </span>
    </xsl:template>
    <xsl:template match="unite_transcription_phonetique">
        <span class="unite_transcription_phonetique">
            <xsl:value-of select="descendant::delimitateur_initial"/>
            <span class="transcription_phonetique">
                <xsl:value-of select="descendant::transcription_phonetique"/>
            </span>
            <xsl:value-of select="descendant::delimitateur_final"/>
        </span>
        <xsl:if test="following-sibling::unite_d_adressage_coordonnee">
            <xsl:value-of select="descendant::coordination"/>
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template match="composant_transcription_phonetique">
            <xsl:attribute name="class">
                <xsl:value-of select="./@compare_phonetique"/>
            </xsl:attribute>
            <span class="unite_transcription_phonetique">
                <xsl:apply-templates select="unite_transcription_phonetique"/>
            </span>
            <xsl:if test="descendant::unite_transcription_phonetique_coordonnee">
                <xsl:text> </xsl:text>
                <xsl:value-of select="descendant::coordination"/>
                <xsl:apply-templates select="unite_transcription_phonetique_coordonnee"/>
            </xsl:if>
    </xsl:template>
    <xsl:template match="unite_transcription_phonetique_coordonnee">
        <xsl:text> </xsl:text>
        <span class="unite_transcription_phonetique_coordonnee">
            <xsl:value-of select="descendant::delimitateur_initial"/>
            <span class="transcription_phonetique">
                <xsl:value-of select="descendant::transcription_phonetique"/>
            </span>
            <xsl:value-of select="descendant::delimitateur_final"/>
        </span>
    </xsl:template>
    <xsl:template match="composant_de_categorisation">
        <xsl:text> </xsl:text>
        <span class="composant_de_categorisation">
            <xsl:attribute name="class">
                <xsl:value-of select="@compare_cate"/>
            </xsl:attribute>
        <span class="categorisation">
            <xsl:apply-templates select="categorisation"/>
        </span>
        <xsl:if test="descendant::categorisation_coordonnee">
            <xsl:text> </xsl:text>
            <xsl:value-of select="descendant::coordination"/>
            <xsl:apply-templates select="categorisation_coordonnee"/>
        </xsl:if>
        </span>
    </xsl:template>
    <xsl:template match="categorisation">
        <span class="categorie">
            <xsl:value-of select="descendant::categorie"/>
        </span>
        <xsl:if test="genre">
            <span class="genre">
                <xsl:value-of select="descendant::genre"/>
            </span>
        </xsl:if>
        <xsl:if test="rection">
            <span class="nombre">
                <xsl:value-of select="descendant::rection"/>
            </span>
        </xsl:if>
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="categorisation_coordonnee">
        <xsl:text> </xsl:text>
        <span>
            <xsl:attribute name="class">
                <xsl:value-of select="concat('categorisation_coordonnee ',./@compare_cate_coordonnee)"/>
            </xsl:attribute>
            <span class="categorie">
            <xsl:value-of select="descendant::categorie"/>
            </span>
            <xsl:if test="genre">
            <span class="genre">
                <xsl:value-of select="descendant::genre"/>
            </span>
            </xsl:if>
            <xsl:if test="rection">
                <span class="nombre">
                    <xsl:value-of select="descendant::rection"/>
                </span>
            </xsl:if>
        </span>
    </xsl:template>
    <xsl:template match="composant_morphologique">
        <span class="composant_morphologique">
        <xsl:choose>
            <xsl:when test="descendant::item_est_une_forme_pluriel">
                <span class="item_est_une_forme_pluriel">
                    <xsl:value-of select="descendant::item_est_une_forme_pluriel"/>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="descendant::delimitateur_initial"/>
                <span class="introducteur_pluriel">
                    <xsl:value-of select="descendant::introducteur_pluriel"/>
                </span>
                <xsl:text> </xsl:text>
                <span class="graphie_pluriel">
                    <xsl:value-of select="descendant::graphie_pluriel"/>
                </span>
                <xsl:value-of select="descendant::delimitateur_final"/>
            </xsl:otherwise>
        </xsl:choose>
        </span>
    </xsl:template>
    <xsl:template match="composant_d_etymologie">
        <span>
            <xsl:attribute name="class">
                <xsl:value-of select="@compare_etymologie"/>
            </xsl:attribute>
            <xsl:apply-templates select="etymologie"/>
        </span>
    </xsl:template>
    <xsl:template match="etymologie">
        <xsl:choose>
            <xsl:when test="position()>1">
                <xsl:value-of select="descendant::conjonction"/>
                <span class="etymologie">
                    <xsl:value-of select="descendant::delimitateur_initial"/>
                    <xsl:if test="operateur_de_provenance">
                        <span class="operateur_de_provenance">
                            <xsl:value-of select="descendant::operateur_de_provenance"/>
                        </span>
                    </xsl:if>
                    <xsl:if test="introducteur_etymologie">
                        <span class="introducteur_etymologie">
                            <xsl:value-of select="descendant::introducteur_etymologie"/>
                        </span>
                    </xsl:if>
                    <xsl:if test="etymon_langue">
                        <span class="etymon_langue">
                            <xsl:value-of select="descendant::etymon_langue"/>
                        </span>
                    </xsl:if>
                    <xsl:if test="etymon">
                        <span class="etymon">
                            <xsl:value-of select="descendant::etymon"/>
                        </span>
                    </xsl:if>
                    <xsl:if test="etymon_glose">
                        <span class="etymon_glose">
                            <xsl:value-of select="descendant::etymon_glose"/>
                        </span>
                    </xsl:if>
                    <xsl:value-of select="descendant::delimitateur_final"/>
                    <xsl:if test="etymon_categorie">
                        <span class="etymon_categorie">
                            <xsl:value-of select="descendant::etymon_categorie"/>
                        </span>
                    </xsl:if>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="etymologie">
                    <xsl:value-of select="descendant::delimitateur_initial"/>
                    <xsl:if test="operateur_de_provenance">
                        <span class="operateur_de_provenance">
                            <xsl:value-of select="descendant::operateur_de_provenance"/>
                        </span>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:if test="etymon_categorie">
                        <span class="etymon_categorie">
                            <xsl:value-of select="descendant::etymon_categorie"/>
                        </span>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:if test="introducteur_etymologie">
                        <span class="introducteur_etymologie">
                            <xsl:value-of select="descendant::introducteur_etymologie"/>
                        </span>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:if test="etymon_langue">
                        <span class="etymon_langue">
                            <xsl:value-of select="descendant::etymon_langue"/>
                        </span>
                    </xsl:if>
                    <xsl:if test="etymon">
                        <xsl:text> </xsl:text>
                        <span class="etymon">
                            <xsl:value-of select="descendant::etymon"/>
                        </span>
                    </xsl:if>
                    <xsl:if test="descendant::separateur">
                    <xsl:value-of select="descendant::separateur"/>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:if test="etymon_glose">
                        <xsl:text> </xsl:text>
                        <span class="etymon_glose">
                            <xsl:value-of select="descendant::etymon_glose"/>
                        </span>
                    </xsl:if>
                    <xsl:value-of select="descendant::delimitateur_final"/>
                   
                </span>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="zone_de_traitement">
        <xsl:for-each select="child::*">
            <div>
                <xsl:attribute name="class">
                    <xsl:value-of select="local-name()"/>
                </xsl:attribute>
                <xsl:apply-templates select="."/>
            </div>
        </xsl:for-each>
    </xsl:template>
    <xsl:template match="Unite_traitement_de_item_monolexical">
        <xsl:for-each select="composant_synonyme|information_morphologique|subdivision_nuance_sens | niveau_langue| marque_usage| marque_domaniale |marque_semantique |introducteur_marque_diaphasique| marque_diaphasique |marque_diachronique | definition | composant_de_renvoi | contextualisation |separateur | UT_locution">
            <span>
                <xsl:attribute name="class">
                    <xsl:value-of select="local-name()"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </span>
           <xsl:text> </xsl:text>
        </xsl:for-each>
        <xsl:apply-templates select="descendant::composant_encyclopedie"/>
    </xsl:template>
  
    <xsl:template match="descendant::subdivision_de_groupe_du_sens |rubique_thematique">
        <div>
            <xsl:attribute name="class">
                <xsl:value-of select="local-name()"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </div>
        <xsl:text> </xsl:text>
    </xsl:template>
    <xsl:template match="descendant::Unite_traitement_de_item_polylexical">
        <div class="Unite_traitement_de_item_polylexical">
            <xsl:for-each select="subdivision_nuance_sens |subdivition_double_barre |numero_subdivision | niveau_langue| marque_domaniale| thematique |separateur|marque_semantique |introducteur_marque_diaphasique|marque_diachronique |marque_diaphasique | definition | composant_de_renvoi | contextualisation |composant_synonyme | complement_encyclopedique |separateur_de_complete_le_sens_definition |  complete_le_sens_definition ">    
        <span>
                <xsl:attribute name="class">
                    <xsl:value-of select="local-name()"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </span>
                <xsl:text> </xsl:text>
        </xsl:for-each>
            <xsl:apply-templates select="UT_locution"/>
        </div>
    </xsl:template>
    <xsl:template match="descendant::Bloc_locution">
        <div class="Bloc_locution">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="UT_locution">
        <div class="UT_locution">
            <xsl:for-each select="introducteur_locution | separateur|delimitateur_initial|niveau_langue|delimitateur_final|locution | coordination |locution_coordonnee | UT_renvoi| separateur_locution | definition_locution | contextualisation_locution | composant_opposition |composant_de_renvoi |marque_domaniale |separateur_de_complete_le_sens_definition |complete_le_sens_definition">
            <span>
                <xsl:attribute name="class">
                    <xsl:value-of select="local-name()"/>
                </xsl:attribute>
                <xsl:value-of select="."/>
            </span>
            <xsl:text> </xsl:text>
        </xsl:for-each>
        </div>
    </xsl:template>
    <xsl:template match="composant_encyclopedie">
        <div class="composant_encyclopedie">
            <span>
            <xsl:value-of select="descendant::introducteur_encyclopedique"/>
            </span>
            <span class="information_encyclopedie">
                <xsl:value-of select="descendant::information_encyclopedie"/>
            </span>
        </div>
    </xsl:template>
</xsl:stylesheet>

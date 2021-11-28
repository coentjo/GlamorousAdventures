Class {
	#name : #NOSScraper,
	#superclass : #Object,
	#category : #NOSScraper
}

{ #category : #accessing }
NOSScraper >> exampleGetContentOf [
| partLink url |
partLink := (self at: 1).
url := 'https://nos.nl', partLink . 
ZnClient new
	url: url;
	get
]

{ #category : #accessing }
NOSScraper >> exampleGetContentOfOneFile [

	<gtExample>
	<noTest>
	| partLink url |
	partLink := self exampleLinksInOneFile at: 1.
	url := 'https://nos.nl' , partLink.
	^ ZnClient new
		url: url;
		get
]

{ #category : #accessing }
NOSScraper >> exampleLinksInOneFile [

	<gtExample>
	<noTest>
	| contents linkLines regExp exampleLine links |
	contents := self exampleOneFile.
	"exampleLine '<a href=""/artikel/2362745-dode-gevonden-na-aardverschuiving-noorwegen"" class=""link-block"">'."
	links:= self linksScrapedFrom: contents .
	^links
	
]

{ #category : #accessing }
NOSScraper >> exampleOneFile [
	<gtExample>
	<noTest>
	"https://nos.nl/nieuws/archief/2021-01-01"
	^ '<!DOCTYPE html>
<!--[if IE 8]>    <html class="no-js lt-ie10 lt-ie9" lang="nl">               <![endif]-->
<!--[if (gt IE 8) & (!IEMobile)]>  <html class="no-js lt-ie10 ie9-desktop" lang="nl"> <![endif]-->
<!--[if (gt IE 8) & (IEMobile)]>   <html class="no-js lt-ie10 ie9-mobile" lang="nl"> <![endif]-->

<!--[if !IE]><!--> <html class="no-js" lang="nl"> <!--<![endif]-->

<head>
  
              <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
        <title>
        NOS Archief: Nieuws
    </title>

        
                    <link rel="shortcut icon" href="https://cdn.nos.nl/assets/nos-symfony/998827d/favicon.ico" type="image/x-icon">
      <link rel="icon" href="https://cdn.nos.nl/assets/nos-symfony/998827d/android-icon.png" sizes="192x192">
      <link rel="apple-touch-icon" href="https://cdn.nos.nl/assets/nos-symfony/998827d/apple-touch-icon.png">
    
              <meta name="app-name" content="NOS">
    <meta name="apple-itunes-app" content="app-id=516491461">
    <meta name="google-play-app" content="app-id=nl.nos.app">
    
                    

            
              <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:700" rel="stylesheet">
            <link href="https://cdn.nos.nl/assets/nos-symfony/998827d/bundles/nossite/css/styles.css" media="all" type="text/css" rel="stylesheet" />
      <link href="https://component-renderer.api.nos.nl/components.client.nos.693e1f54d9e3a6442df0.css" media="all" type="text/css" rel="stylesheet"/>

    
          <script src="https://cdn.nos.nl/assets/nos-symfony/998827d/js/lib/modernizr/modernizr.min.js"></script>

              <script type="text/javascript">
          var _sf_async_config = _sf_async_config || {};
          _sf_async_config.uid = 64919;
          _sf_async_config.domain = window.location.hostname; // DOMAIN
          _sf_async_config.flickerControl = false;
          _sf_async_config.articleBlockSelector = ''li.cb-mab''; // this class is set in the component renderer
          _sf_async_config.useCanonical = true;
          var _sf_startpt = (new Date()).getTime();
      </script>
      <script async src="//static.chartbeat.com/js/chartbeat_mab_image.js"></script>
    
          <!--[if lt IE 9]>
        <script src="https://cdn.nos.nl/assets/nos-symfony/998827djs/lib/vendor/respond/respond.1.1.0.min.js"></script>
      <![endif]-->
    
    <script src="https://polyfill.io/v3/polyfill.min.js?features=CustomEvent%2Object.assign%2CArray.prototype.find%2CArray.prototype.findIndex%2CIntersectionObserver"></script>
</head>

    <body class="category-index category-index--archive" data-comscore="{&quot;name&quot;:&quot;track.click.index.nieuws.archive&quot;}">
<script>
  window.instancesContainer = {
    instances: {},
    registerInstance: function(name, instance, options) {
      window.instancesContainer.instances[name] = {};
      window.instancesContainer.instances[name].loader = new Promise(function (resolve, reject) {
        var inst = new instance(options);
        window.instancesContainer.instances[name].instance = inst;
        inst.init().then(function() {
          resolve(inst);
        })
      });

      window.instancesContainer.setupRegistryEvent(name);

      return window.instancesContainer.instances[name].loader;
    },
    getInstance: function(name) {
        return new Promise(function (resolve, reject) {
          return window.instancesContainer.instances[name].loader
            .then(function() {
              resolve(window.instancesContainer.instances[name].instance)
            })
            .catch(function() {
              reject(''Could not get instance'', error)
            })
        });
    },
    setupRegistryEvent: function(name) {
      var event = undefined;
      if (typeof(Event) === ''function'') {
          event = new Event(name + ''_loading'');
      } else {
          event = document.createEvent(''Event'');
          event.initEvent(name + ''_loading'', true, true);
      }

      window.dispatchEvent(event);
    },
  }
</script>

      <div data-vue="app-banner"></div>
    <header id="nav" class="nav-wrapper">
  		


  <div data-ssr-name="components/nos/_global/Navigation/Navigation" data-ssr-id="77398080-5047-11ec-85c3-e501ffe585d8"><header data-server-rendered="true" class="bar_28Na2J9H"><ol class="list_1fzP3zJH"><li><a href="#menu" class="link_2o2aI7eT">Ga naar het menu</a></li> <li><a href="#content" class="link_2o2aI7eT">Ga naar de inhoud</a></li></ol> <div class="container_JyDByhf6 hideOnMobile_3P2O5Vch"><nav class="navigation_12wQxGO0"><ol id="menu" class="menu_15PH6fX8"><li class="listItem_18e2jsEJ"><a href="/" class="logoLink_1c-S9666"><svg xmlns="http://www.w3.org/2000/svg" width="79" height="28" viewBox="0 0 79 28" class="nosLogo_2fQkVIuQ"><g fill="none" fill-rule="evenodd"><path fill="#949494" d="M78.94 18.93c0-5.31-2.57-6.91-9.32-8.54-3.46-.8-4.41-1.27-4.41-2.28 0-.96.53-1.66 2.76-1.66 2.72 0 5.1.93 7.48 2.55 0 0 3.15-5.01 3.49-5.87C76.2 1.12 72.92 0 68.35 0c-6.48 0-10.58 3.44-10.58 8.54 0 5.4 3.1 7.19 9.58 8.7 3.6.84 4.57 1.46 4.57 2.47 0 1.27-.85 1.74-3.5 1.74-2.49 0-5.9-1.36-7.85-2.71l-3.6 5.87a21.29 21.29 0 0011.3 3.29c6.45 0 10.67-2.33 10.67-8.73"></path> <path fill="#E61E14" d="M27 13.95C27 6.25 33.32 0 41.12 0c7.8 0 14.13 6.25 14.13 13.95S48.92 27.9 41.12 27.9C33.32 27.9 27 21.65 27 13.95m7.2 0c0-3.78 3.1-6.84 6.92-6.84 3.83 0 6.93 3.06 6.93 6.84s-3.1 6.84-6.93 6.84a6.89 6.89 0 01-6.93-6.84"></path> <path fill="#949494" d="M23.67 27.9V0h-7.33v14.35S6.88 0 6.82 0H.36v27.9h7.32V13.55l9.63 14.35h6.36z"></path></g></svg></a></li> <li aria-haspopup="true" class="listItem_2fZxURrd"><a title="Nieuws" href="/" class="anchor_3RuvwRy5">
        Nieuws
        <svg viewBox="0 0 9 6" xmlns="http://www.w3.org/2000/svg" class="chevron_3NMjkcVr"><path d="M4.1789 4.8654a.4507.4507 0 00.6057.0335l.037-.0335 3.0453-3.0806a.4635.4635 0 000-.6502.4507.4507 0 00-.6058-.0335l-.0369.0335-2.7244 2.7556-2.724-2.7556a.4507.4507 0 00-.6058-.0335l-.037.0336a.4637.4637 0 00-.033.6128l.0331.0373L4.179 4.8654z" fill="currentColor" fill-rule="nonzero"></path></svg></a> <!----></li> <li aria-haspopup="true" class="listItem_2fZxURrd"><a title="Sport" href="/sport" class="anchor_3RuvwRy5">
        Sport
        <svg viewBox="0 0 9 6" xmlns="http://www.w3.org/2000/svg" class="chevron_3NMjkcVr"><path d="M4.1789 4.8654a.4507.4507 0 00.6057.0335l.037-.0335 3.0453-3.0806a.4635.4635 0 000-.6502.4507.4507 0 00-.6058-.0335l-.0369.0335-2.7244 2.7556-2.724-2.7556a.4507.4507 0 00-.6058-.0335l-.037.0336a.4637.4637 0 00-.033.6128l.0331.0373L4.179 4.8654z" fill="currentColor" fill-rule="nonzero"></path></svg></a> <!----></li> <li aria-haspopup="true" class="listItem_2fZxURrd"><a href="/uitzendingen" class="anchor_3RuvwRy5">
        Uitzendingen
      </a> <!----></li></ol></nav> <nav class="navigation_12wQxGO0"><ol class="subMenu_aXWsrISZ"><li class="listItem_18e2jsEJ"><a href="/weer" title="Weer" class="anchor_2WjlocAx"><svg width="24" height="18" title="Weer" viewBox="0 0 24 18" xmlns="http://www.w3.org/2000/svg" class="weatherIcon_225J9Lf7"><g fill="currentColor" fill-rule="nonzero"><path d="M24 14.52c0 1.8-1.45 3.25-3.25 3.25-.57 0-2 0-5.94.03l-5.95.04A3.25 3.25 0 018 11.47 3.25 3.25 0 0112 8.54a5.07 5.07 0 019.7 2.87c1.33.4 2.3 1.65 2.3 3.11zm-3.28-1.74a.75.75 0 01-.7-1.04 3.57 3.57 0 10-6.8-2.05c-.1.5-.67.76-1.11.5a1.72 1.72 0 00-.88-.24 1.75 1.75 0 00-1.72 2.03.75.75 0 01-.7.87 1.74 1.74 0 00.05 3.49l5.94-.04 5.95-.03a1.75 1.75 0 00.03-3.5h-.06zM11.32 5.37a.75.75 0 11-.72 1.31 2.86 2.86 0 00-4.07 3.5.75.75 0 11-1.41.5 4.37 4.37 0 016.2-5.31zm-1.38-3a.75.75 0 11-1.5 0V.75a.75.75 0 011.5 0v1.62zM.75 9.94a.75.75 0 010-1.5h1.62a.75.75 0 110 1.5H.75zm1.94-6.19A.75.75 0 113.75 2.7L4.9 3.84a.75.75 0 01-1.07 1.05L2.7 3.75z"></path></g></svg></a></li> <li class="listItem_18e2jsEJ"><a href="/zoeken" title="Zoeken" class="anchor_2WjlocAx"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M10.04 0a10.04 10.04 0 017.7 16.47l6 6a.9.9 0 01-1.2 1.33l-.08-.06-5.99-5.99A10.04 10.04 0 1110.04 0zm0 1.8a8.24 8.24 0 100 16.48 8.24 8.24 0 000-16.48z" fill="currentColor" fill-rule="nonzero"></path></svg></a></li> <li class="listItem_18e2jsEJ"><a title="NPO Start" href="https://www.npostart.nl/?ns_campaign=meernpo&ns_mchannel=omroep&ns_source=nos&ns_linkname=button" target="_blank" class="logoLink_1c-S9666"><svg width="50" height="35" viewBox="0 0 50 35" xmlns="http://www.w3.org/2000/svg" class="npoStartLogo_1u5wIZGE"><g fill-rule="nonzero" fill="none"><path d="M32.1 20.02L19.24 32.88c-1.3 1.3-2.78 1.3-4.08 0L2.3 20.03c-1.29-1.3-1.29-2.78 0-4.08L15.16 3.1c1.3-1.3 2.78-1.3 4.08 0L32.1 15.95c1.3 1.3 1.3 2.78 0 4.08z" fill="#D7D8D6"></path> <path d="M13.79 12.33l-.94-.94c-.4-.4-.76-.38-1.2.06l-.82.82c-.44.43-.45.8-.06 1.19l.94.94c.4.39.76.38 1.2-.06l.81-.82c.44-.44.45-.8.07-1.2zm1.02-1c.97.97.99 2.14-.1 3.22l-.83.83a1.6 1.6 0 01-.72.47l.72.72c.37.36.32.76.04 1.04s-.68.33-1.05-.03l-3.13-3.13c-.96-.97-.98-2.13.1-3.21l.78-.78c1.09-1.09 2.25-1.07 3.22-.1l.97.97zm3.87-3.9l-.94-.93c-.4-.4-.76-.38-1.2.06l-.82.82c-.43.43-.45.8-.06 1.19l.94.94c.4.39.76.38 1.2-.06l.82-.82c.43-.44.45-.8.06-1.2zm1.02-.99c.97.97.99 2.14-.1 3.22l-.77.78c-1.09 1.08-2.25 1.07-3.22.1l-.98-.98c-.96-.97-.98-2.13.1-3.22l.78-.77c1.09-1.09 2.25-1.07 3.22-.1l.97.97zm-8.77 10.97c.36.36.31.77.03 1.05-.28.27-.68.32-1.04-.04l-2.05-2.05c-.4-.4-.76-.38-1.2.06l-.82.82c-.43.43-.45.8-.06 1.19l2.06 2.05c.36.36.31.77.03 1.05-.27.27-.68.33-1.04-.03l-2.07-2.08c-.97-.97-.99-2.13.1-3.22l.77-.77c1.09-1.09 2.25-1.07 3.22-.1l2.07 2.07zm7-1.46c-1.29 1.3-1.29 2.78 0 4.08L30.8 32.88c1.3 1.3 2.78 1.3 4.07 0l12.86-12.86c1.3-1.29 1.3-2.78 0-4.07L34.87 3.09c-1.3-1.3-2.78-1.3-4.07 0L17.94 15.95" fill="#FF6D00"></path> <path d="M24.48 17.36c-.6-.15-.8-.2-.8-.47 0-.36.52-.41.83-.41.27 0 .63.06.93.17.08.02.16.05.24.05.22 0 .32-.17.39-.33l.05-.12a.7.7 0 00.05-.23c0-.18-.12-.32-.32-.4a3.8 3.8 0 00-1.32-.21c-1.33 0-2.09.56-2.09 1.55 0 1.1.91 1.3 1.87 1.51h.02c.53.12.79.2.79.48 0 .1 0 .43-.89.43-.35 0-.72-.07-1.12-.21a.76.76 0 00-.24-.05c-.22 0-.32.16-.39.33l-.05.13a.64.64 0 00-.06.23c0 .18.12.33.32.4.4.16.91.24 1.53.24 1.38 0 2.14-.56 2.14-1.56 0-1.1-.91-1.31-1.88-1.53zm10.58.22l-3.18-2a.4.4 0 00-.62.34v4c0 .3.35.5.62.33l3.18-2a.4.4 0 000-.67zM30.4 19.6c-.04-.2-.15-.3-.34-.3l-.18.02a2 2 0 01-.24.02c-.5 0-.8-.15-.8-.91v-1.85h1.1c.32 0 .47-.16.47-.48v-.13c0-.33-.15-.48-.48-.48h-1.08v-.7c0-.32-.16-.48-.48-.48h-.3c-.33 0-.48.16-.48.48v.7h-.28c-.32 0-.48.15-.48.48v.13c0 .32.16.48.48.48h.28v1.96c0 1.28.61 1.9 1.88 1.9.24 0 .47-.04.64-.07.23-.04.36-.18.36-.4l-.03-.2-.04-.17zm12.64.18L43 19.6c-.04-.2-.15-.3-.34-.3l-.18.02-.25.02c-.48 0-.78-.15-.78-.91v-1.85h1.08c.33 0 .48-.16.48-.48v-.13c0-.33-.15-.48-.48-.48h-1.08v-.7c0-.32-.16-.48-.48-.48h-.3c-.33 0-.48.16-.48.48v.7h-.28c-.32 0-.48.15-.48.48v.13c0 .32.16.48.48.48h.28v1.96c0 1.28.61 1.9 1.88 1.9.24 0 .46-.04.63-.07.24-.04.37-.18.37-.4l-.03-.2zm-4.14-3.92l-.02.19-.02.09c-.06.27-.15.43-.42.43-.06 0-.13 0-.22-.02a2.96 2.96 0 00-1.1.05v3.27c0 .32-.15.47-.47.47h-.3c-.33 0-.48-.15-.48-.48V16.2c0-.3.14-.5.44-.58a5.58 5.58 0 012.17-.17c.27.03.42.19.42.43z" fill="#FFFFFE"></path></g></svg></a></li> <li aria-haspopup="true" class="listItem_2fZxURrd lastListItem_2AnGWxpe"><button class="anchor_3RuvwRy5"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="moreIcon_1zEfvNiV"><path d="M3.13 8.87a3.13 3.13 0 110 6.26 3.13 3.13 0 010-6.26zm8.87 0a3.13 3.13 0 110 6.26 3.13 3.13 0 010-6.26zm8.87 0a3.13 3.13 0 110 6.26 3.13 3.13 0 010-6.26zm-17.74 1.8a1.33 1.33 0 100 2.66 1.33 1.33 0 000-2.66zm8.87 0a1.33 1.33 0 100 2.66 1.33 1.33 0 000-2.66zm8.87 0a1.33 1.33 0 100 2.66 1.33 1.33 0 000-2.66z" fill="currentColor" fill-rule="nonzero"></path></svg></button> <!----></li></ol></nav></div> <div class="container_waCDgxd_ hideOnDesktop_4G2rCM4p"><nav class="navigation_u2mVGOq2"><ol id="menu" class="menu_1lRMHJ2K"><li class="listItem_mASJsHfT"><a href="/" class="logoLink_3EEqGh_y"><svg xmlns="http://www.w3.org/2000/svg" width="79" height="28" viewBox="0 0 79 28"><g fill="none" fill-rule="evenodd"><path fill="#949494" d="M78.94 18.93c0-5.31-2.57-6.91-9.32-8.54-3.46-.8-4.41-1.27-4.41-2.28 0-.96.53-1.66 2.76-1.66 2.72 0 5.1.93 7.48 2.55 0 0 3.15-5.01 3.49-5.87C76.2 1.12 72.92 0 68.35 0c-6.48 0-10.58 3.44-10.58 8.54 0 5.4 3.1 7.19 9.58 8.7 3.6.84 4.57 1.46 4.57 2.47 0 1.27-.85 1.74-3.5 1.74-2.49 0-5.9-1.36-7.85-2.71l-3.6 5.87a21.29 21.29 0 0011.3 3.29c6.45 0 10.67-2.33 10.67-8.73"></path> <path fill="#E61E14" d="M27 13.95C27 6.25 33.32 0 41.12 0c7.8 0 14.13 6.25 14.13 13.95S48.92 27.9 41.12 27.9C33.32 27.9 27 21.65 27 13.95m7.2 0c0-3.78 3.1-6.84 6.92-6.84 3.83 0 6.93 3.06 6.93 6.84s-3.1 6.84-6.93 6.84a6.89 6.89 0 01-6.93-6.84"></path> <path fill="#949494" d="M23.67 27.9V0h-7.33v14.35S6.88 0 6.82 0H.36v27.9h7.32V13.55l9.63 14.35h6.36z"></path></g></svg></a></li> <li aria-haspopup="true" class="listItem_2fZxURrd"><button aria-label="Nieuws" title="Nieuws" class="anchor_3RuvwRy5">
        Nieuws
        <svg viewBox="0 0 9 6" xmlns="http://www.w3.org/2000/svg" class="chevron_3YFhNvQ2"><path d="M4.1789 4.8654a.4507.4507 0 00.6057.0335l.037-.0335 3.0453-3.0806a.4635.4635 0 000-.6502.4507.4507 0 00-.6058-.0335l-.0369.0335-2.7244 2.7556-2.724-2.7556a.4507.4507 0 00-.6058-.0335l-.037.0336a.4637.4637 0 00-.033.6128l.0331.0373L4.179 4.8654z" fill="currentColor" fill-rule="nonzero"></path></svg></button> <!----></li> <li aria-haspopup="true" class="listItem_2fZxURrd"><button aria-label="Nieuws" title="Nieuws" class="anchor_3RuvwRy5">
        Sport
        <svg viewBox="0 0 9 6" xmlns="http://www.w3.org/2000/svg" class="chevron_3YFhNvQ2"><path d="M4.1789 4.8654a.4507.4507 0 00.6057.0335l.037-.0335 3.0453-3.0806a.4635.4635 0 000-.6502.4507.4507 0 00-.6058-.0335l-.0369.0335-2.7244 2.7556-2.724-2.7556a.4507.4507 0 00-.6058-.0335l-.037.0336a.4637.4637 0 00-.033.6128l.0331.0373L4.179 4.8654z" fill="currentColor" fill-rule="nonzero"></path></svg></button> <!----></li></ol></nav> <nav class="navigation_u2mVGOq2"><ol class="menu_1lRMHJ2K"><li aria-haspopup="true" class="listItem_2fZxURrd"><button class="anchor_3RuvwRy5"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="moreIcon_1oX7Dcl1"><path d="M3.13 8.87a3.13 3.13 0 110 6.26 3.13 3.13 0 010-6.26zm8.87 0a3.13 3.13 0 110 6.26 3.13 3.13 0 010-6.26zm8.87 0a3.13 3.13 0 110 6.26 3.13 3.13 0 010-6.26zm-17.74 1.8a1.33 1.33 0 100 2.66 1.33 1.33 0 000-2.66zm8.87 0a1.33 1.33 0 100 2.66 1.33 1.33 0 000-2.66zm8.87 0a1.33 1.33 0 100 2.66 1.33 1.33 0 000-2.66z" fill="currentColor" fill-rule="nonzero"></path></svg></button> <!----></li> <li class="listItem_mASJsHfT hasDivider_2rLiI72n"><a href="/zoeken" title="Zoeken" class="anchor_SrTzS95-"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="iconStyle_1-eH3gt0"><path d="M10.04 0a10.04 10.04 0 017.7 16.47l6 6a.9.9 0 01-1.2 1.33l-.08-.06-5.99-5.99A10.04 10.04 0 1110.04 0zm0 1.8a8.24 8.24 0 100 16.48 8.24 8.24 0 000-16.48z" fill="currentColor" fill-rule="nonzero"></path></svg></a></li></ol></nav></div></header></div>
<script type="application/json" data-ssr-name="components/nos/_global/Navigation/Navigation" data-ssr-id="77398080-5047-11ec-85c3-e501ffe585d8">{"pathInfo":"/nieuws/archief/2021-01-01"}</script>

  	</header>
	
        	<main id="content">
  		  <div class="supply-channel">
    <div class="supply-channel__container">
        <div class="supply-channel__titles">
            <h2 class="supply-channel__title">
              NOS Nieuws
            </h2>

                    </div>

        




  

<nav class="bread-crumbs js-bread-crumbs">
  <ul class="bread-crumbs__list">
          <li class="bread-crumbs__list-item bread-crumbs__list-item--active">
                  <div
  class="bread-crumbs-dropdown js-bread-crumbs-dropdown"
  data-expand-modifier="bread-crumbs-dropdown--expanded"
>
  <a
  class="bread-crumbs-link bread-crumbs-link--active  js-bread-crumbs-dropdown-toggle"
  href="/nieuws/archief"
      data-expand-modifier="bread-crumbs-link--expanded"
  >Archief <span class="icon-expand bread-crumbs-link__icon"></span></a>

  <ul class="bread-crumbs-dropdown__list">
          <li class="bread-crumbs-dropdown__list-item ">
        <a
  class="bread-crumbs-dropdown-link "
  href="/nieuws"
>Overzicht</a>
      </li>
          <li class="bread-crumbs-dropdown__list-item ">
        <a
  class="bread-crumbs-dropdown-link "
  href="/nieuws/videos"
>Video&#039;s</a>
      </li>
          <li class="bread-crumbs-dropdown__list-item bread-crumbs-dropdown__list-item--active">
        <a
  class="bread-crumbs-dropdown-link bread-crumbs-dropdown-link--active"
  href="/nieuws/archief"
>Archief</a>
      </li>
      </ul>
</div>
              </li>
      </ul>
</nav>


    </div>
</div>

  <div class="row">
    



  
        
          <div id="page_top">

        

        
                  <div class="col_wrapper row">

  <div class="col_aside">
    

<nav class="nav-aside padded-small">

  <ul class="nav-aside_sub">

    <li class="nav-aside__item ">
      <a href="/nieuws"
         class="nav-aside__link">Overzicht</a>
              <ul class="nav-aside__subnav">

  <li class="nav-aside__subitem ">
    <a href="/nieuws/videos"
       class="nav-aside__link nav-aside__link--sub"
       title="Video''s"
    >
      Video''s
    </a>
  </li>
  <li class="nav-aside__subitem nav-aside__subitem--active">
    <a href="/nieuws/archief" class="nav-aside__link nav-aside__link--sub" title="Archief">Archief</a>
  </li>

  
</ul>
          </li>

    
            <li class="nav-aside__item ">
        <a href="/nieuws/binnenland"
           class="nav-aside__link" title="Categorie Binnenland">
          Binnenland
        </a>
              </li>

    
            <li class="nav-aside__item ">
        <a href="/nieuws/buitenland"
           class="nav-aside__link" title="Categorie Buitenland">
          Buitenland
        </a>
              </li>

    
            <li class="nav-aside__item ">
        <a href="/nieuws/regio"
           class="nav-aside__link" title="Categorie Regionaal nieuws">
          Regionaal nieuws
        </a>
              </li>

    
            <li class="nav-aside__item ">
        <a href="/nieuws/politiek"
           class="nav-aside__link" title="Categorie Politiek">
          Politiek
        </a>
              </li>

    
            <li class="nav-aside__item ">
        <a href="/nieuws/economie"
           class="nav-aside__link" title="Categorie Economie">
          Economie
        </a>
              </li>

    
            <li class="nav-aside__item ">
        <a href="/nieuws/koningshuis"
           class="nav-aside__link" title="Categorie Koningshuis">
          Koningshuis
        </a>
              </li>

    
            <li class="nav-aside__item ">
        <a href="/nieuws/tech"
           class="nav-aside__link" title="Categorie Tech">
          Tech
        </a>
              </li>

    
            <li class="nav-aside__item ">
        <a href="/nieuws/cultuur-en-media"
           class="nav-aside__link" title="Categorie Cultuur &amp; Media">
          Cultuur &amp; Media
        </a>
              </li>

    
            <li class="nav-aside__item ">
        <a href="/nieuws/opmerkelijk"
           class="nav-aside__link" title="Categorie Opmerkelijk">
          Opmerkelijk
        </a>
              </li>

      </ul>

</nav>

  </div>

  <div class="col_main section-page_top">
              
            



  
        
          <div id="main">

        

        
                            
            



  
        
          <section id="archive">

        

        
                            
            
              
              


<div class="padded-small divide-bottom--large">

  <h2 class="h4">Archief van vrijdag 1 januari 2021</h2>

    <form action="/nieuws/archief" method="POST" class="form">
  <div class="form__row">
    <span class="form__text--inline">Selecteer datum </span>
    <input name="date" type="date" placeholder="01-01-2021" class="js-datepicker form__input--inline" data-currentdate="01-01-2021" />
    <input type="submit" value="Gaan" class="js-hidden form__input--inline">
  </div>
</form></div>

<div id="archief" class="padded-small">
  <ul class="list-time">
                  
        <li class="list-time__item">
          <a href="/liveblog/2362698-vs-totaal-aantal-besmettingen-boven-20-miljoen-londense-basisscholen-blijven-dicht" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T23:02:19+0100">23:02</time>
            </div>
            <div class="list-time__title link-hover">VS: totaal aantal besmettingen boven 20 miljoen • Londense basisscholen blijven dicht</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/liveblog/2362696-koolmonoxide-in-feestbunker-arnhem-116-000-kilo-vuurwerk-in-beslag-genomen" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T21:57:29+0100">21:57</time>
            </div>
            <div class="list-time__title link-hover">Koolmonoxide in feestbunker Arnhem • 116.000 kilo vuurwerk in beslag genomen</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362764-amerikaans-congres-veegt-voor-het-eerst-veto-van-trump-van-tafel" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T21:14:39+0100">21:14</time>
            </div>
            <div class="list-time__title link-hover">Amerikaans Congres veegt voor het eerst veto van Trump van tafel </div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362762-groot-illegaal-feest-in-frankrijk-laat-zich-niet-stoppen-door-de-politie" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T20:54:55+0100">20:54</time>
            </div>
            <div class="list-time__title link-hover">Groot illegaal feest in Frankrijk laat zich niet stoppen door de politie</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362755-gemeente-den-haag-onderzoekt-demonstratie-met-dansend-publiek-duindorp" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T18:26:39+0100">18:26</time>
            </div>
            <div class="list-time__title link-hover">Gemeente Den Haag onderzoekt demonstratie met dansend publiek Duindorp</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362746-grapperhaus-overgrote-deel-heeft-zich-met-oud-en-nieuw-voortreffelijk-opgesteld" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T17:34:46+0100">17:34</time>
            </div>
            <div class="list-time__title link-hover">Grapperhaus: overgrote deel heeft zich met Oud en Nieuw voortreffelijk opgesteld</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362745-dode-gevonden-na-aardverschuiving-noorwegen" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T17:17:51+0100">17:17</time>
            </div>
            <div class="list-time__title link-hover">Dode gevonden na aardverschuiving Noorwegen</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362742-rivm-dit-jaar-twee-derde-minder-fijnstof-door-vuurwerk" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T16:52:59+0100">16:52</time>
            </div>
            <div class="list-time__title link-hover">RIVM: dit jaar twee derde minder fijnstof door vuurwerk</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362738-twee-medewerkers-gevangenis-nieuwegein-neergestoken-door-gedetineerde" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T16:23:35+0100">16:23</time>
            </div>
            <div class="list-time__title link-hover">Twee medewerkers gevangenis Nieuwegein neergestoken door gedetineerde</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362737-nieuwjaarsfeestje-bosnie-herzegovina-draait-uit-op-koolmonoxide-drama" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T16:17:49+0100">16:17</time>
            </div>
            <div class="list-time__title link-hover">Nieuwjaarsfeestje Bosnië-Herzegovina draait uit op koolmonoxide-drama</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362735-8215-nieuwe-coronabesmettingen-minder-dan-gemiddeld" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T16:10:33+0100">16:10</time>
            </div>
            <div class="list-time__title link-hover">8215 nieuwe coronabesmettingen, minder dan gemiddeld</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362727-mijn-gevonden-op-iraakse-olietanker-bemanning-geevacueerd" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T14:54:16+0100">14:54</time>
            </div>
            <div class="list-time__title link-hover">Mijn gevonden op Iraakse olietanker, bemanning geëvacueerd</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362722-na-25-jaar-stopt-flash-player-en-daarmee-tienduizenden-online-games" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T13:43:32+0100">13:43</time>
            </div>
            <div class="list-time__title link-hover">Na 25 jaar stopt Flash Player en daarmee tienduizenden online games</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362720-25-burgers-gedood-in-congo-autoriteiten-wijzen-naar-radicaal-islamitische-adf" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T13:14:38+0100">13:14</time>
            </div>
            <div class="list-time__title link-hover">&#039;25 burgers gedood in Congo, autoriteiten wijzen naar radicaal-islamitische ADF&#039;</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362717-amerikaanse-beurs-haalt-chinese-telecombedrijven-van-lijst" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T12:58:21+0100">12:58</time>
            </div>
            <div class="list-time__title link-hover">Amerikaanse beurs haalt Chinese telecombedrijven van lijst</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362714-ethiopische-troepen-doodden-76-mensen-bij-rellen-na-moord-op-protestzanger" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T11:57:54+0100">11:57</time>
            </div>
            <div class="list-time__title link-hover">Ethiopische troepen doodden 76 mensen bij rellen na moord op protestzanger</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362713-pfizer-biontech-topman-lastig-om-snel-meer-vaccins-te-produceren" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T11:46:34+0100">11:46</time>
            </div>
            <div class="list-time__title link-hover">Pfizer/BioNTech-topman: lastig om snel meer vaccins te produceren</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362712-amerikaanse-rapper-mf-doom-49-overleden" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T11:28:55+0100">11:28</time>
            </div>
            <div class="list-time__title link-hover">Amerikaanse rapper MF DOOM (49) overleden</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362711-twaalf-aanhoudingen-na-carbidexplosie-bij-hotel-in-joure" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T11:17:42+0100">11:17</time>
            </div>
            <div class="list-time__title link-hover">Twaalf aanhoudingen na carbidexplosie bij hotel in Joure</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362708-voorzitter-politiebond-veel-agressie-tegen-politiemensen-en-brandweerlieden" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T10:28:31+0100">10:28</time>
            </div>
            <div class="list-time__title link-hover">Voorzitter politiebond: &#039;Veel agressie tegen politiemensen en brandweerlieden&#039;</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362705-feesten-beeindigd-en-me-ingezet-in-meerdere-plaatsen" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T10:01:32+0100">10:01</time>
            </div>
            <div class="list-time__title link-hover">Feesten beëindigd en ME ingezet in meerdere plaatsen </div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362701-thuis-aan-de-champagne-en-toch-vuurwerk-op-veel-plaatsen-zo-gingen-we-2021-in" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T08:32:33+0100">08:32</time>
            </div>
            <div class="list-time__title link-hover">Thuis aan de champagne en toch vuurwerk op veel plaatsen, zo gingen we 2021 in </div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362700-staatssteun-voor-caribische-luchtvaartmaatschappij-winair" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T08:15:37+0100">08:15</time>
            </div>
            <div class="list-time__title link-hover">Staatssteun voor Caribische luchtvaartmaatschappij Winair</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362699-handjevol-vrachtwagens-op-eerste-brexit-ferry-van-2021-van-calais-naar-dover" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T08:10:47+0100">08:10</time>
            </div>
            <div class="list-time__title link-hover">Handjevol vrachtwagens op eerste &#039;brexit-ferry&#039; van 2021 van Calais naar Dover</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/liveblog/2362621-toch-vuurwerk-op-veel-plaatsen-ondanks-verbod-hulpverleners-op-meerdere-plekken-belaagd" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T07:41:24+0100">07:41</time>
            </div>
            <div class="list-time__title link-hover">Toch vuurwerk op veel plaatsen ondanks verbod • Hulpverleners op meerdere plekken belaagd</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362697-wekdienst-01-01-2021-van-start-maar-zonder-nieuwjaarsduik-vk-nu-echt-los-van-eu" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T07:35:37+0100">07:35</time>
            </div>
            <div class="list-time__title link-hover">Wekdienst 01/01: 2021 van start (maar zonder nieuwjaarsduik) • VK nu echt los van EU</div>
          </a>
        </li>
              
        <li class="list-time__item">
          <a href="/artikel/2362687-aantal-coronadoden-in-vlaams-verzorgingshuis-gestegen-na-bezoek-hulpsint" class="link-block">
            <div class="list-time__time">
              <span class="icon-time ico-space-right"></span>
              <time datetime="2021-01-01T02:23:53+0100">02:23</time>
            </div>
            <div class="list-time__title link-hover">Aantal coronadoden in Vlaams verzorgingshuis gestegen na bezoek hulpsint</div>
          </a>
        </li>
            </ul>
</div>

            
                  
        
      </section>
      

                  
        
      </div>
      

                  
  </div>

</div>
        
      </div>
      
  </div>


  	</main>
  
	  	  	<footer id="footer">
  		

  <div class="row">
    <div class="footer">
      <div class="footer__container">
        <div class="footer__column">
          <h3 class="footer__logo">
            <a href="/">
              <span class="ir img-nos"> </span>
              <span class="vh">NOS</span>
            </a>
          </h3>
          <ul class="footer__list footer__list--visible-on-tablet">
            <li class="footer__item">
              <a href="/nieuws" class="footer__link">Nieuws</a>
            </li>
            <li class="footer__item">
              <a href="/sport" class="footer__link">Sport</a>
            </li>
            <li class="footer__item">
              <a href="/uitzendingen" class="footer__link">Uitzendingen</a>
            </li>
            <li class="footer__item">
              <a href="/teletekst" class="footer__link">Teletekst</a>
            </li>
          </ul>
        </div>

        <div class="footer__column">
          <h3 class="footer__title">Info</h3>
          <ul class="footer__list footer__list--first">
            <li class="footer__item">
              <a href="https://over.nos.nl/" rel="noreferrer noopener" target="_blank" class="footer__link">Over de NOS</a>
            </li>
            <li class="footer__item">
              <a href="https://www.werkenbijdenos.nl/" rel="noreferrer noopener" target="_blank" class="footer__link">Werken bij de NOS</a>
            </li>
            <li class="footer__item">
              <a href="https://over.nos.nl/adres-en-route/" rel="noreferrer noopener" target="_blank" class="footer__link">Contact</a>
            </li>
            <li class="footer__item">
              <a href="https://over.nos.nl/journalistieke-verantwoording" rel="noreferrer noopener" target="_blank" class="footer__link">Journalistieke verantwoording</a>
            </li>
            <li class="footer__item">
              <a href="/herstel" class="footer__link">Herstelrubriek</a>
            </li>
          </ul>
          <ul class="footer__list footer__list--sibling">
            <li class="footer__item">
              <a href="https://ombudsman.npo.nl/" rel="noreferrer noopener" target="_blank" class="footer__link">Ombudsman NPO</a>
            </li>
            <li class="footer__item">
              <a href="https://over.nos.nl/onze-programmas/53/nos-apps" rel="noreferrer noopener" target="_blank" class="footer__link">NOS Apps</a>
            </li>
            <li class="footer__item">
              <a href="https://over.nos.nl/organisatie/regelgeving/" rel="noreferrer noopener" target="_blank" class="footer__link">Voorwaarden</a>
            </li>
            <li class="footer__item">
              <a href="https://over.nos.nl/organisatie/privacy-reglement/" rel="noreferrer noopener" target="_blank" class="footer__link">Privacy</a>
            </li>
          </ul>
        </div>

        <div class="footer__column footer__column--visible-on-tablet">
          <h3 class="footer__title">Volg de NOS</h3>
          <ul class="footer__list footer__list--first">
            <li class="footer__item">
              <a href="https://twitter.com/nos/" class="footer__link share__twitter" target="_blank" rel="noreferrer noopener">
                <span class="icons-wrap">
                  <span class="icon-twitter share__icon"></span>
                </span>
                Twitter
              </a>
            </li>
            <li class="footer__item">
              <a href="https://www.facebook.com/nos" class="footer__link share__facebook" target="_blank" rel="noreferrer noopener">
                <span class="icons-wrap">
                  <span class="icon-facebook share__icon"></span>
                </span>
                Facebook
              </a>
            </li>
            <li class="footer__item">
              <a href="https://instagram.com/nos/" class="footer__link share__instagram" target="_blank" rel="noreferrer noopener">
                <span class="icons-wrap">
                  <span class="icon-instagram share__icon"></span>
                </span>
                Instagram
              </a>
            </li>
          </ul>
          <ul class="footer__list footer__list--sibling">
            <li class="footer__item">
              <a href="https://www.youtube.com/channel/UC5xziMuoFAOpX9mwUVhe2Jw/channels" class="footer__link share__youtube" target="_blank" rel="noreferrer noopener">
                <span class="icons-wrap">
                  <span class="icon-youtube share__icon"></span>
                </span>
                YouTube
              </a>
            </li>
            <li class="footer__item">
              <a href="/feeds" class="footer__link share__rss" target="_blank" rel="noreferrer noopener">
                <span class="icons-wrap">
                  <span class="icon-rss share__icon"></span>
                </span>
                RSS
              </a>
            </li>
          </ul>

          <div class="fb-button vh">
            <div class="fb-like" data-href="https://facebook.com/nos" data-layout="button_count" data-action="like" data-show-faces="true" data-share="false">Like op Facebook</div>
          </div>

        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="divide-top">
      <ul class="list-disclaimer text-smaller">
        <li class="list-disclaimer__item">
                    <a href="#" class="npo_cc_settings_link link-hover">Cookie-instellingen</a>
        </li>
        <li class="list-disclaimer__item--right secret">
          <span class=""><i class="secret__hover">&copy;</i> NOS 2021</span>
        </li>
      </ul>
    </div>
  </div>

  <a href="#nav" title="Terug naar boven" class="to-the-top js-scrollto" data-target="body">
    <span class="vh">Naar boven</span>
    <span class="icon-chevron-up icon-red"></span>
  </a>

  	</footer>
  
          <script>var COMSCORE = null;</script>

      
<script>
  var CHARTBEAT = true;
  var SECTIONS = "archive-index";
  var AUTHORS = "nieuws";
  var CUSTOMPATH = null;

  var _sf_async_config = _sf_async_config || {};
</script>

  
<script>
  var ENV = ''prod'';
  var DOMAIN = ''preproduction'';
  var RECOMMENDATIONS = true;
  var EVENTTRACKING = true;
  var googletag = googletag || {};
</script>

<script src="https://component-renderer.api.nos.nl/components-with-bootloader.nos.client-only.2b20857a389cf6d9b87f.js"></script>
<script src="https://cdn.nos.nl/assets/nos-symfony/998827d/build/js/runtime.js"></script>
<script src="https://cdn.nos.nl/assets/nos-symfony/998827d/build/js/init.js"></script>

  <script src="https://cdn.nos.nl/assets/nos-symfony/998827d/build/js/sites/nosnl.js"></script>
<script src="https://cdn.nos.nl/assets/nos-symfony/998827d/build/js/pages/index.js" class="js-site-page"></script>

  


</body>
</html>
'
]

{ #category : #accessing }
NOSScraper >> linksScrapedFrom: contents [ 
	| linkLines regExp |
	linkLines := OrderedCollection new.
	regExp := ' *<a href="(.*)" *class="link-block">.*' asRegex.
	contents linesDo: [ :line | 
		(regExp matches: line) ifTrue: [ 
			linkLines add: (regExp subexpression: 2) ] ].
	^ linkLines
]

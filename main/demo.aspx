﻿    <%@ Page Language="vb" AutoEventWireup="false" CodeBehind="demo.aspx.vb" Inherits="HearMe.demo" %>

    <%--<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    </asp:Content>--%>

    <!DOCTYPE html>
    <html lang="en">
      <head>
        <title>Contact Picker API Demo</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="/style.css">
        <meta name="theme-color" content="#3f51b5">
        <!-- OT Expires 2020-01-14 -->
        <meta http-equiv="origin-trial" content="AkAQoYg8XDMUqBR/HwcOUoqAx3Z5+RyarNB5KwUx9ZXygz7wjd8cxqKvwY3FOO1CPdqccip8g8Ayuf9/pqTxmwUAAABheyJvcmlnaW4iOiJodHRwczovL2NvbnRhY3QtcGlja2VyLmdsaXRjaC5tZTo0NDMiLCJmZWF0dXJlIjoiQ29udGFjdHNNYW5hZ2VyIiwiZXhwaXJ5IjoxNTc5MDI5NTcwfQ==">
      </head>  
      <body>
        <h1>
          Contact Picker API Demo
        </h1>
    
        <p id="requireHTTPS" class="hidden">
          <b>STOP!</b> This page <b>must</b> be served over HTTPS.
          Please <a>reload this page via HTTPS</a>.
        </p>
       
        <p id="notSupported">
          <b>Sorry!</b> This browser doesn't support the Contact
          Picker API, which required for this demo. Try enabling the
          <code>#enable-experimental-web-platform-features</code> in
          chrome://flags and try again.
        </p>
       
        <p>
          Access to the user’s contacts has been a feature of native apps since (almost) 
          the dawn of time. The <b>Contact Picker API</b> is a new, on-demand picker 
          that allows users to select an entry or entries from their contact list 
          and share limited details of the selected contact(s) with a website. 
          It allows users to share only what they want, when they want, and makes 
          it easier for users to reach and connect with their friends and family.
        </p>

        <p>
          <b>Note:</b> This demo requires Chrome 80 or later 
          running on Android M or later to work properly.
        </p>

        <ol>
          <li>
            <input type="checkbox" id="multiple" />
            <label for="multiple">Multiple results?</label>
          </li>
          <li>
            <input type="checkbox" id="name" disabled />
            <label for="name">Include name?</label>
          </li>
          <li>
            <input type="checkbox" id="email" disabled />
            <label for="email">Include email addresses?</label>
          </li>
          <li>
            <input type="checkbox" id="tel" disabled />
            <label for="tel">Include telephone numbers?</label>
          </li>
          <li>
            <input type="checkbox" id="address" disabled />
            <label for="address">Include addresses? (Chrome 84 and later)</label>
          </li>
          <li>
            <input type="checkbox" id="icon" disabled />
            <label for="icons">Include icons? (Chrome 84 and later)</label>
          </li>
        </ol>

        <p>
          This demo <b>does not</b>
          share or upload your contacts. It simply shows them on screen, and no
          contact data is transferred off this device.
        </p>
    
        <p>
          <button id="butRequest" type="button" disabled>
            Open contact picker
          </button>
        </p>
    
        <p>
          <b>Results</b>
        </p>
        <ul id="results">
          <li>Results will be populated here.</li>
        </ul>
        <pre id="rawResults">
        </pre>
    
        <p>
          See <a href="https://developers.google.com/web/updates/2019/08/contact-picker" target="_blank">A Contact Picker for the Web</a>
          for complete details on the API, including use cases, how it was designed, and how to use it.
        </p>
    
        <p>
          Check out the 
          <a href="https://glitch.com/edit/#!/contact-picker">source</a>
          for this sample, or
          <a href="https://glitch.com/edit/#!/remix/contact-picker">remix it</a> on Glitch.
        </p>
    
    
        <script src="/common.js"></script>
        <script src="/demo.js"></script>

      </body>
    </html>
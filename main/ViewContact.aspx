<%@ Page Title="Contacts" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ContactPicker.aspx.vb" Inherits="HearMe.ContactPicker" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="container body-content new1">
        <h2 style="text-align: center"><%: Title %></h2>

        <style>
            .demo-list-two {
                width: 300px;
            }
        </style>

        <div class="row">
            <div class="col-md-8">
                <hr />
                <ul class="demo-list-two mdl-list" id="contact">
<%--                    <li class="mdl-list__item mdl-list__item--two-line">
                        <span class="mdl-list__item-primary-content">
                            <i class="material-icons mdl-list__item-avatar">person</i>
                            <span id="contactName1">Bryan Cranston</span>
                            <span class="mdl-list__item-sub-title" id="contactNo1">0123456789</span>
                        </span>

                    </li>
                    <li class="mdl-list__item mdl-list__item--two-line">
                        <span class="mdl-list__item-primary-content">
                            <i class="material-icons mdl-list__item-avatar">person</i>
                            <span id="contactName2">Bob Odenkirk</span>
                            <span class="mdl-list__item-sub-title" id="contactNo2">01975618237</span>
                        </span>

                    </li>
                    <li class="mdl-list__item mdl-list__item--two-line">
                        <span class="mdl-list__item-primary-content">
                            <i class="material-icons mdl-list__item-avatar">person</i>
                            <span id="contactName3">Mark Zukernberg</span>
                            <span class="mdl-list__item-sub-title" id="contactNo3">0198657928</span>
                        </span>
                    </li>--%>
                </ul>

                <!-- Colored mini FAB button -->
                <div class="text-center" style="margin-top: 70%">
                    <a href="../ContactPicker" class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored" style="height: 3.0em; width: 3.0em; background-color:#3F51B5; box-shadow: 0 10px 18px 0 rgba(0,0,0,0.2), 0 8px 22px 0 rgba(0,0,0,0.19)">
                        <i class="fas fa-user-plus" style="margin-left: 5px; margin-top: 23px"></i>
                    </a>
                </div>

                <script>

                    check = JSON.parse(sessionStorage.getItem("Check"));
                    i = 0;
                    while (i < check.length) {
                        j = i + 1;
                        str1 = 'contactName' + j;
                        str2 = 'contactNo' + j;

                        var node = document.getElementById('contact');
                        var newNode = document.createElement('li');
                        newNode.className = "mdl-list__item mdl-list__item--two-line";
                        node.appendChild(newNode);
                        newNode.setAttribute("id", "li" + j);

                        var node1 = document.getElementById('li' + j);
                        var newNode1 = document.createElement('span');
                        newNode1.className = "mdl-list__item-primary-content";
                        node1.appendChild(newNode1);
                        newNode1.setAttribute("id", "span1" + j);

                        var node2 = document.getElementById('span1' + j);
                        var newNode2 = document.createElement('i');
                        newNode2.className = "material-icons mdl-list__item-avatar";
                        node2.appendChild(newNode2);
                        newNode2.setAttribute("id", "i1" + j);

                        newNode2.appendChild(document.createTextNode('person'));

                        var node3 = document.getElementById('span1' + j);
                        var newNode3 = document.createElement('span');
                        //newNode2.className = "material-icons mdl-list__item-avatar";
                        node3.appendChild(newNode3);
                        newNode3.setAttribute("id", str1);

                        newNode3.appendChild(document.createTextNode(check[i].substring(0, check[i].length - 12)));

                        var node4 = document.getElementById('span1' + j);
                        var newNode4 = document.createElement('span');
                        newNode4.className = "mdl-list__item-sub-title";
                        node4.appendChild(newNode4);
                        newNode4.setAttribute("id", str2);

                        newNode4.appendChild(document.createTextNode(check[i].split("_").pop()));

                        i++;
                    }
                </script>

                <!--        <ol>
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
      </div>
-->
            </div>
        </div>

        <%--        <script src="/common.js"></script>
        <script src="/demo.js"></script>--%>
</asp:Content>

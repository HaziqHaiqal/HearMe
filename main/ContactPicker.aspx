<%@ Page Title="Select Contacts" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ContactPicker.aspx.vb" Inherits="HearMe.ContactPicker" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <div class="container body-content new1">
<%--        <a onclick="goBack()" class="mdl-button mdl-js-button mdl-js-ripple-effect" style="height: 5em; width: 5em;">
            <i class="fas fa-arrow-left" style="margin-left: 5px;"></i>
        </a>--%>
        <h2 style="text-align: center"><%: Title %></h2>

        <style>
            .demo-list-two {
                width: 300px;
            }
        </style>

        <div class="row">
            <div class="col-md-8">
                <hr />
                <ul class="demo-list-control mdl-list" style="font-family: quicksand;">
                    <li class="mdl-list__item mdl-list__item--two-line">
                        <span class="mdl-list__item-primary-content">
                            <i class="material-icons mdl-list__item-avatar">person</i>
                            <span>Spongebob Squarepant</span>
                            <span class="mdl-list__item-sub-title">0199547526</span>
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-1">
                                <input type="checkbox" id="list-checkbox-1" class="mdl-checkbox__input" name="contact" value="Spongebob Squarepant_01995475264" />
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item mdl-list__item--two-line">
                        <span class="mdl-list__item-primary-content">
                            <i class="material-icons mdl-list__item-avatar">person</i>
                            <span>Patrick Star</span>
                            <span class="mdl-list__item-sub-title">01145566436</span>
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-2">
                                <input type="checkbox" id="list-checkbox-2" class="mdl-checkbox__input" name="contact" value="Patrick Star_01145566436" />
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item mdl-list__item--two-line">
                        <span class="mdl-list__item-primary-content">
                            <i class="material-icons mdl-list__item-avatar">person</i>
                            <span>Squidward</span>
                            <span class="mdl-list__item-sub-title">0137595844</span>
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-3">
                                <input type="checkbox" id="list-checkbox-3" class="mdl-checkbox__input" name="contact" value="Squidward_01375958446" />
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item mdl-list__item--two-line">
                        <span class="mdl-list__item-primary-content">
                            <i class="material-icons mdl-list__item-avatar">person</i>
                            <span>Eugene Krab</span>
                            <span class="mdl-list__item-sub-title">01153875425</span>
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-4">
                                <input type="checkbox" id="list-checkbox-4" class="mdl-checkbox__input" name="contact" value="Eugene Krab_01123456789" />
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item mdl-list__item--two-line">
                        <span class="mdl-list__item-primary-content">
                            <i class="material-icons mdl-list__item-avatar">person</i>
                            <span>Mark Zukernberg</span>
                            <span class="mdl-list__item-sub-title">01986579258</span>
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-5">
                                <input type="checkbox" id="list-checkbox-5" class="mdl-checkbox__input" name="contact" value="Mark Zukernberg_0198657928" />
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item mdl-list__item--two-line">
                        <span class="mdl-list__item-primary-content">
                            <i class="material-icons mdl-list__item-avatar">person</i>
                            <span>Mary Me</span>
                            <span class="mdl-list__item-sub-title">01388547672</span>
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-6">
                                <input type="checkbox" id="list-checkbox-6" class="mdl-checkbox__input" name="contact" value="Mary Me_0138854762" />
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item mdl-list__item--two-line">
                        <span class="mdl-list__item-primary-content">
                            <i class="material-icons mdl-list__item-avatar">person</i>
                            <span>Plankton</span>
                            <span class="mdl-list__item-sub-title">01774954240</span>
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-7">
                                <input type="checkbox" id="list-checkbox-7" class="mdl-checkbox__input" name="contact" value="Plankton_0177495420" />
                            </label>
                        </span>
                    </li>
                    <li class="mdl-list__item mdl-list__item--two-line">
                        <span class="mdl-list__item-primary-content">
                            <i class="material-icons mdl-list__item-avatar">person</i>
                            <span>John Sinar</span>
                            <span class="mdl-list__item-sub-title">01875148935</span>
                        </span>
                        <span class="mdl-list__item-secondary-action">
                            <label class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect" for="list-checkbox-8">
                                <input type="checkbox" id="list-checkbox-8" class="mdl-checkbox__input" name="contact" value="John Sina_0187514935" />
                            </label>
                        </span>
                    </li>
                </ul>

<%--                <style>
                    .footer {
                        position: fixed;
                        left: 0;
                        bottom: 0;
                        width: 10%;
                        height: 8%;
                        color: white;
                        text-align: center;
                    }
                </style>--%>

                <div class="text-center footer">
                    <button id="demo-show-toast" class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" type="button" style="width: 50%; height: 100%; border-top-right-radius: 5px; border-top-left-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; box-shadow: 0 6px 16px 0 rgba(0,0,0,0.2), 0 4px 18px 0 rgba(0,0,0,0.19)">Save Contact</button>
                    <div id="demo-toast-example" class="mdl-js-snackbar mdl-snackbar">
                        <div class="mdl-snackbar__text"></div>
                        <button class="mdl-snackbar__action" type="button"></button>
                    </div>
                </div>

                <script>
                    function goBack() {
                        window.history.back();
                    }

                    check = [];
                    function getSelectedCheckboxValues(name) {
                        const checkboxes = document.querySelectorAll(`input[name="${name}"]:checked`);
                        let values = [];
                        checkboxes.forEach((checkbox) => {
                            values.push(checkbox.value);
                        });
                        return values;
                    }
                    const btn = document.querySelector('#demo-show-toast');
                    btn.addEventListener('click', (event) => {
                        check = (getSelectedCheckboxValues('contact'));
                        sessionStorage.setItem("Check", JSON.stringify(check));
                    });

                    (function () {
                        'use strict';
                        window['counter'] = 0;
                        var snackbarContainer = document.querySelector('#demo-toast-example');
                        var showToastButton = document.querySelector('#demo-show-toast');
                        showToastButton.addEventListener('click', function () {
                            'use strict';
                            var data = { message: 'Contact Saved' };
                            snackbarContainer.MaterialSnackbar.showSnackbar(data);
                        });
                    }());
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

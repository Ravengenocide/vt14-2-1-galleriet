﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Galleriet.Default" ViewStateMode="Disabled" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title>Galleriet</title>
        <link href="/Style/Whydoesntitworkdamn.css" rel="stylesheet" />
        <script src="/Scripts/Main.js"></script>
    </head>
    <body>
        <h1>Galleriet</h1>
        <form id="form1" runat="server">
            <ol>
                <li>
                    <div class="largeimage">
                        <asp:Image ImageUrl="imageurl" ID="Largeimage" runat="server" Visible="false" />
                    </div>
                </li>
                <li class="liimageswitcher">
                    <div class="imageswitcher" id="imageswitcher">
                        <asp:Repeater ID="repeater" runat="server" ItemType="Galleriet.LinkData" SelectMethod="repeater_GetData">
                            <ItemTemplate>
                                <!--Visible=Item.Display-->
                                <asp:HyperLink NavigateUrl='<%# "?file=" + Item.Name %>' runat="server">
                                    <asp:Image ImageUrl="<%# Item.thumbLink  %>" runat="server" />
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </li>
                <li>
                    <asp:ValidationSummary runat="server" ForeColor="Red" HeaderText="Fel inträffade. Korrigera felet och försök igen." />
                    <asp:RequiredFieldValidator ErrorMessage="En fil måste väljas." ControlToValidate="FileUpload1" runat="server" Display="None" />
                    <asp:RegularExpressionValidator ErrorMessage="Endast bilder av typerna gif, jpeg och png är tillåtna." ControlToValidate="FileUpload1" runat="server" ValidationExpression="^.*\.(jpg|png|gif)$" Display="None" />
                </li>
                <li>
                    <asp:TextBox runat="server" ID="QueryStringLabel" TextMode="MultiLine" Width="800" Height="500" />
                </li>
                <li>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button Text="Ladda upp" ID="UploadButton" runat="server" OnClick="UploadButton_Click" />
                </li>
            </ol>
        </form>
    </body>

    </html>

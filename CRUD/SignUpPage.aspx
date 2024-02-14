<%@ Page Title="" Language="C#" MasterPageFile="~/HomePage.Master" AutoEventWireup="true" CodeBehind="SignUpPage.aspx.cs" Inherits="CRUD.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border: 2px solid thin;
            background-color:white;
            color:black;
        }
        .auto-style2 {
        /* width: 139px; */
            height: 5px;
        width: 232px;
    }
    .auto-style3 {
        text-align: right;
        background-color: #66FFFF;
    }
    .auto-style4 {
        /* width: 139px; */
            height: 5px;
        width: 232px;
        background-color: #00FFFF;
    }
    .auto-style5 {
        background-color: #00FFFF;
    }
    </style>
    <script>
        function Valid_SignIn()
        {
            /*debugger;*/
            var Mobile, Email, UserName, Password, ConfirmPassword;
            Mobile = document.getElementById('<%= txt_Mobile.ClientID %>').value;
            Email = document.getElementById('<%= txt_Email.ClientID %>').value;
            UserName = document.getElementById('<%= txtUserName.ClientID %>').value;
            Password = document.getElementById('<%= txt_PWD.ClientID%>').value;
            ConfirmPassword = document.getElementById('<%= txt_ConPwd.ClientID%>').value;
            if (Mobile == '' && Email == '' && UserName == '' && Password == '' && ConfirmPassword == '')
            {
                alert("Enter All Fields");
                return false;
            }
            if (Mobile == '')
            {
                alert("Enter Mobile Number");
                return false;
            }
            if (Email == '')
            {
                alert("Enter Email Address");
                return false;
            }
            if (UserName == '')
            {
                alert("Enter UserName");
                return false;
            }
            if (Password == '')
            {
                alert("Enter Password");
                return false;
            }
            if (ConfirmPassword == '')
            {
                alert("Enter Confirm Password");
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:LinkButton ID="Lnk_Signin" runat="server" CausesValidation="False" ForeColor="Black" OnClick="Lnk_Signin_Click">SIGNIN</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">MOBILE</td>
                    <td>
                        <asp:TextBox ID="txt_Mobile" runat="server" MaxLength="12"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Mobile" runat="server" ControlToValidate="txt_Mobile" ErrorMessage="ENTER MOBILE NUMBER" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Mobile" runat="server" ControlToValidate="txt_Mobile" ErrorMessage="INVALID MOBILE NUMBER" Font-Bold="False" SetFocusOnError="True" ValidationExpression="^[7-9][0-9]{9}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">EMAIL</td>
                    <td>
                        <asp:TextBox ID="txt_Email" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ControlToValidate="txt_Email" ErrorMessage="ENTER EMAIL ADDRESS" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Email" runat="server" ControlToValidate="txt_Email" ErrorMessage="INVALID EMAIL ADDRESS" Font-Bold="False" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">USERNAME</td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_UserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="ENTER USERNAME" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">PASSWORD</td>
                    <td>
                        <asp:TextBox ID="txt_PWD" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_PWD" runat="server" ControlToValidate="txt_PWD" ErrorMessage="ENTER PASSWORD" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">CONFIRM PASSWORD</td>
                    <td>
                        <asp:TextBox ID="txt_ConPwd" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_ConPwd" runat="server" ControlToValidate="txt_ConPwd" ErrorMessage="ENTER CONFIRM PWD" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cmpv_ConPwd" runat="server" ControlToValidate="txt_ConPwd" ControlToCompare="txt_PWD" ErrorMessage="PWD NOT MATCHED" SetFocusOnError="true"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button ID="Btn_SignUp" runat="server" Text="SIGNUP" OnClientClick="Valid_SignIn();" OnClick="Btn_SignUp_Click"/>
                        <asp:Button ID="Btn_Reset" runat="server" CausesValidation="False" OnClick="Btn_Reset_Click" Text="RESET" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style5">&nbsp;</td>
                </tr>
            </table>
</asp:Content>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RESET_PWD.aspx.cs" Inherits="CRUD.RESET_PWD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 180px;
        }
        .auto-style3 {
            background-color: #00FFFF;
        }
        .auto-style4 {
            width: 180px;
            background-color: #00FFFF;
        }
    </style>
    <script>
        function Valid_Reset_Pwd()
        {
            var UserName, OldPwd, NewPwd, ConfirmPwd;
            UserName = document.getElementById('<%= txt_UserName.ClientID %>').value;
            OldPwd = document.getElementById('<%= txt_Password.ClientID %>').value;
            NewPwd = document.getElementById('<%= txt_New_Pwd.ClientID %>').value;
            ConfirmPwd = document.getElementById('<%= txt_Confirm_Pwd.ClientID %>').value;
            if (UserName == '' && OldPwd == '' && NewPwd == '' && ConfirmPwd == '')
            {
                alert("Enter All Fields!");
                return false;
            }
            if (UserName == '')
            {
                alert("Enter UserName");
                return false;
            }
            if (OldPwd == '')
            {
                alert("Enter Old Password");
                return false;
            }
            if (NewPwd == '')
            {
                alert("Enter New Password");
                return false;
            }
            if (ConfirmPwd == '')
            {
                alert("Enter Confirm Password");
                return false;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">USERNAME</td>
                    <td>
                        <asp:TextBox ID="txt_UserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_UserName" runat="server" ControlToValidate="txt_UserName" ErrorMessage="ENTER USERNAME" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">PASSWORD</td>
                    <td>
                        <asp:TextBox ID="txt_Password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Password" runat="server" ControlToValidate="txt_Password" ErrorMessage="ENTER PASSWORD" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">NEW PASSWORD</td>
                    <td>
                        <asp:TextBox ID="txt_New_Pwd" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_New_Pwd" runat="server" ControlToValidate="txt_New_Pwd" ErrorMessage="ENTER NEW PASSWORD" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">CONFIRM PASSWORD</td>
                    <td>
                        <asp:TextBox ID="txt_Confirm_Pwd" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_Con_Pwd" runat="server" ControlToValidate="txt_Confirm_Pwd" ErrorMessage="ENTER CONFIRM PWD" SetFocusOnError="True"></asp:RequiredFieldValidator>
&nbsp;<asp:CompareValidator ID="cmpv_Con_Pwd" runat="server" ControlToCompare="txt_New_Pwd" ControlToValidate="txt_Confirm_Pwd" ErrorMessage="PWD NOT MATCHED" SetFocusOnError="True"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:LinkButton ID="Lnk_Back_SignIn" runat="server" ForeColor="Black" OnClick="Lnk_Back_SignIn_Click" CausesValidation="False">BACK TO SIGN IN</asp:LinkButton>
                    </td>
                    <td class="auto-style3">
                        <asp:Button ID="Btn_Reset_Pwd" runat="server" OnClick="Btn_Reset_Pwd_Click" OnClientClick="Valid_Reset_Pwd();" Text="RESET" />
                        <asp:Button ID="Btn_Cancel" runat="server" CausesValidation="False" OnClick="Btn_Cancel_Click" Text="CANCEL" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

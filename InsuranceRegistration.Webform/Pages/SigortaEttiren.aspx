<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SigortaEttiren.aspx.cs" Inherits="BupaBootcamp.Webform.SigortaEttiren" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="assent/css/bootstrap.min.css">
    <title>Başvuru Formu</title>
</head>

<body>
    <div class="container">
        <br>
        <h3>Sağlık Sigortası Başvuru Formu</h3>
        <h4>Sigorta Ettiren Girişi</h4>
        <div class="col-md-6 form-group">
            <form method="post" runat="server">
                <div class="row">
                    <div class="col-md-6">
                        <label>Sigorta Ettiren Adı</label>
                        <asp:TextBox CssClass="form-control" ID="adi" runat="server" required="required"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Sigorta Ettiren Soyadı</label>
                        <asp:TextBox CssClass="form-control" ID="soyadi" runat="server" required="required"></asp:TextBox>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-6">
                        <label>Tc Kimlik No</label>
                        <asp:TextBox CssClass="form-control" ID="tckimlikno" runat="server" TextMode="Number" required="required"></asp:TextBox>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-6">
                        <label>Cinsiyet</label>
                        <asp:DropDownList CssClass="form-control" ID="cinsiyet" runat="server">
                            <asp:ListItem>E</asp:ListItem>
                            <asp:ListItem>K</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label>Doğum tarihi</label>
                        <asp:TextBox CssClass="form-control" ID="dogumtarihi" runat="server" TextMode="Date" required="required"></asp:TextBox>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-6">
                        <label>Gsm</label>
                        <asp:TextBox CssClass="form-control" ID="telefon" runat="server" TextMode="Phone" required="required"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>Email</label>
                        <asp:TextBox CssClass="form-control" ID="email" runat="server" TextMode="Email" required="required"></asp:TextBox>
                    </div>
                </div>
                <br>
                <label>Adres</label>
                <asp:TextBox CssClass="form-control" ID="adres" runat="server" TextMode="MultiLine" required="required"></asp:TextBox>
                <br>
                <div class="row">
                    <div class="d-flex justify-content-end">
                        <asp:Button CssClass="btn btn-success" ID="sigortaligirisi" runat="server" Text="Sigortalı Girişi--->" OnClick="sigortaligirisi_Click" />
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>

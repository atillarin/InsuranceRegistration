<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Odeme.aspx.cs" Inherits="BupaBootcamp.Webform.Odeme" %>

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
        <h4>Ödeme Ekranı</h4>
        <asp:Label ID="Label1" runat="server" Text="Teklif Numarası: "></asp:Label>
        <asp:Label ID="offerid" runat="server" Text="0"></asp:Label>
        <asp:Label CssClass="alert-danger" ID="odemedurumu" runat="server" Text="Ödeme Yapıldı" Visible="false"></asp:Label>
        <br>
        <br>
        <form id="form1" runat="server">
            <div class="col-md-10">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/3.0.0/jquery.payment.min.js"></script>
                <div class="padding">
                    <div class="row">
                        <div class="container-fluid d-flex justify-content-start">
                            <div class="col-sm-6 col-md-6">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="row">
                                            <div class="col-md-6"><span>Kredi/Banka Kartı Ödeme</span> </div>
                                            <div class="col-md-6 text-right" style="margin-top: -5px;">
                                                <img src="https://img.icons8.com/color/36/000000/visa.png">
                                                <img src="https://img.icons8.com/color/36/000000/mastercard.png">
                                                <img src="https://img.icons8.com/color/36/000000/amex.png">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body" style="height: 250px">
                                        <div class="form-group">
                                            <label for="cc-number" class="control-label">Kart Numarası</label>
                                            <input id="cc-number" type="tel" class="input-lg form-control cc-number" autocomplete="cc-number" placeholder="•••• •••• •••• ••••" required>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="cc-exp" class="control-label">Son Kullanma Tarihi</label>
                                                    <input id="cc-exp" type="tel" class="input-lg form-control cc-exp" autocomplete="cc-exp" placeholder="•• / ••" required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="cc-cvc" class="control-label">Cvc</label>
                                                    <input id="cc-cvc" type="tel" class="input-lg form-control cc-cvc" autocomplete="off" placeholder="••••" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="numeric" class="control-label">Kart Sahibinin Adı</label>
                                            <input type="text" class="input-lg form-control">
                                        </div>
                                        <div class="form-group">
                                            <asp:Button CssClass="btn btn-success btn-lg form-control" ID="odemeyap" runat="server" Text="Ödeme Yap" Font-Size="Small" UseSubmitBehavior="False" OnClick="odemeyap_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <br>

                <div class="row">
                    <div class="d-flex justify-content-end col-md-6">
                        <asp:Button CssClass="btn btn-success" ID="sonlandir" runat="server" Text="Kaydı Sonlandır" OnClick="sonlandir_Click" UseSubmitBehavior="False" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>

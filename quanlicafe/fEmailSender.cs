using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using QuanLyQuanCafe.DAO;

namespace QuanLyQuanCafe
{
    public partial class fEmailSender : Form
    {
        public fEmailSender()
        {
            InitializeComponent();
            txbEmail.KeyPress += new KeyPressEventHandler(txbEmail_KeyPress);
        }
        private void txbEmail_KeyPress(object sender, KeyPressEventArgs e)
        {
          
            if (e.KeyChar == (char)Keys.Enter)
            {
                
                btnForgotPassword_Click(sender, e);
                e.Handled = true; 
            }
        }
        private void btnForgotPassword_Click(object sender, EventArgs e)
        {
            string email = txbEmail.Text;

            
            if (IsEmailValid(email))
            {
                
                if (AccountDAO.Instance.CheckEmailExists(email))
                {
                    string verificationCode = GenerateVerificationCode();

                    string username = AccountDAO.Instance.GetUsernameByEmail(email);

                    AccountDAO.Instance.InsertVerificationCode(username, email, verificationCode);
                    SendVerificationCode(email, verificationCode);
                    fVerifyCode verifyCodeForm = new fVerifyCode(email);
                    verifyCodeForm.Show();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Email không tồn tại trong hệ thống.");
                }
            }
            else
            {
                MessageBox.Show("Email không hợp lệ.");
            }
        }



        private bool IsEmailValid(string email)
        {
            string pattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, pattern);
        }

        private string GenerateVerificationCode()
        {
            Random random = new Random();
            return random.Next(100000, 999999).ToString();
        }

        public static void SendVerificationCode(string email, string verificationCode)
        {
            try
            {
                var smtpClient = new SmtpClient("smtp.gmail.com")
                {
                    Port = 587,
                    Credentials = new NetworkCredential("--EmailCuaBan--@gmail.com", "PassEmail"),
                    EnableSsl = true,
                };

                // Soạn thư
                var mailMessage = new MailMessage
                {
                    From = new MailAddress("--EmailCuaBan--@gmail.com", "CaffeMV"),
                    Subject = "Mã xác thực",
                    Body = $@"
                            <html>
                            <head>
                                <style>
                                    body {{
                                        font-family: Arial, sans-serif;
                                        font-size: 14px;
                                        color: #333;
                                    }}
                                    .verification-code {{
                                        font-weight: bold;
                                        font-size: 24px;
                                        color: #4CAF50; /* Màu xanh */
                                        padding: 10px;
                                        border: 2px dashed #4CAF50; /* Đường viền kiểu dashed */
                                        display: inline-block; /* Để làm cho nó nổi bật */
                                        margin-top: 20px; /* Cách lề trên */
                                    }}
                                    .message {{
                                        margin-bottom: 20px; /* Khoảng cách dưới cùng */
                                    }}
                                </style>
                            </head>
                            <body>
                                <div class='message'>
                                    Chào bạn,<br/><br/>
                                    Mã xác thực của bạn là:
                                </div>
                                <div class='verification-code'>{verificationCode}</div>
                                <div class='message'>
                                    Vui lòng sử dụng mã này để xác thực tài khoản của bạn.
                                </div>
                            </body>
                            </html>",
                    IsBodyHtml = true,
                };
                mailMessage.To.Add(email);

                // Gửi email
                smtpClient.Send(mailMessage);
                MessageBox.Show("Đã gửi mã xác thực đến email.");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Gửi email thất bại: {ex.Message}");
            }
        }

        private void txbThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace WpfSMSApp.View.Store
{
    /// <summary>
    /// MyAccount.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class AddStore : Page
    {
        public AddStore()
        {
            InitializeComponent();
        }

        private  void Page_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                //라벨 에러메세지 숨겨놓기 !
                LblUserIdentityNumber.Visibility = LblUserSurName.Visibility = Visibility.Hidden;

            }
            catch (Exception ex)
            {
                Commons.LOGGER.Error($"예외발생 EditAccount Loaded : {ex}");
                throw ex; 
            }
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack(); 
        }

        /// <summary>
        /// 정상 입력값 확인 메서드 
        /// </summary>
        /// <returns></returns>
        public bool IsValidInput()
        {
            bool isValid = true;

            if (string.IsNullOrEmpty(TxtUserIdentityNumber.Text))
            {
                LblUserIdentityNumber.Visibility = Visibility.Visible;
                LblUserIdentityNumber.Text = "사원번호를 입력하세요";
                isValid = false;
            }
            return isValid; 
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}

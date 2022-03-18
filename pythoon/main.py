from PyQt5.QtWidgets import QWidget, QApplication, QLineEdit, QPushButton, QLabel, QMessageBox
from PyQt5.QtGui import QIcon, QPixmap, QPalette, QBrush
import sys
import gui


class MyEnter(QWidget):
    def __init__(self):
        super(MyEnter, self).__init__()
        self.initUI()

    def initUI(self):
        # 设置窗口的剧本属性（窗口名，窗口图标，窗口大小，窗口锁定）
        self.setWindowTitle('重庆邮电大学超市管理系统-登录')
        self.setWindowIcon(QIcon('新世纪百货.jpg'))
        self.resize(1200, 703)
        self.setFixedSize(self.width(), self.height())

        # 设置背景图片
        window_pale = QPalette()
        window_pale.setBrush(self.backgroundRole(), QBrush(QPixmap("新世纪百货.jpg")))
        self.setPalette(window_pale)

        # 添加登录组件
        btn = QPushButton('确认', self)
        btn.move(600, 460)
        label_title = QLabel('欢迎使用新世纪百货管理系统', self)
        label_title.move(500, 100)
        label_account = QLabel('数据库账号:', self)
        label_account.move(505, 205)
        label_password = QLabel('数据库密码:', self)
        label_password.move(505, 305)
        label_database = QLabel('数据库:', self)
        label_database.move(505,405)
        self.input_account = QLineEdit(self)
        self.input_account.move(600, 200)
        self.input_password = QLineEdit(self)
        self.input_password.move(600, 300)
        self.input_database = QLineEdit(self)
        self.input_database.move(600,400)
        # 设置登录事件
        btn.clicked.connect(self.enter_pass)
        # 显示
        self.show()

    def enter_pass(self):
        id = self.input_account.text()
        pw = self.input_password.text()
        db = self.input_database.text()
        # if 后的条件循环改为有返回值的mysql登录函数
        if gui.login_test(id,pw,db):
            self.mw = gui.MyWidget()
            self.mw.show()
            self.close()
        else:
            choice = QMessageBox.question(self, '系统提示', ' 输入的账号或密码有错 \n是否重新输入？')
            if choice == QMessageBox.No:
                exit()


if __name__ == '__main__':
    app = QApplication(sys.argv)
    ME = MyEnter()
    app.exec_()
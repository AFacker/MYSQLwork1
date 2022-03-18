
from PyQt5 import QtWidgets, QtGui
from PyQt5.QtWidgets import QMessageBox, QHeaderView
import pymysql
from PyQt5.QtGui import QIcon, QPixmap, QPalette, QBrush

def login_test(id,pw,db):
    global user,password,database
    user = id
    password = pw
    database =db
    try:
        pymysql.connect(host='localhost', user=id, password=pw,db=db)
        return 1
    except: return 0
class MyWidget(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()
        self.initUi()
        self.conn = pymysql.connect(host='localhost', db=database, user=user, password=password)
    def initUi(self):
        # 设置窗口标题
        self.setWindowTitle('重庆邮电大学超市管理系统')
        self.setWindowIcon(QIcon('新世纪百货.jpg'))

        # 设置窗口大小
        self.resize(900, 700)

        # 创建一个窗口部件
        self.widget = QtWidgets.QWidget()

        # 创建一个网格布局
        self.grid_layout = QtWidgets.QGridLayout()

        # 设置窗口部件的布局为网格布局
        self.widget.setLayout(self.grid_layout)

        # 创建一个按钮组
        self.group_box = QtWidgets.QGroupBox('数据库按钮')
        self.group_box_layout = QtWidgets.QVBoxLayout()
        self.group_box.setLayout(self.group_box_layout)

        # 创建一个表格部件
        self.table_widget = QtWidgets.QTableView()

        # 将上述两个部件添加到网格布局中
        self.grid_layout.addWidget(self.group_box, 0, 0)
        self.grid_layout.addWidget(self.table_widget, 0, 1)

        # 创建按钮组的按钮
        self.b_show_gys = QtWidgets.QPushButton("品牌表")
        self.b_show_wp = QtWidgets.QPushButton("供应商表")
        self.b_show_ch = QtWidgets.QPushButton("产品表")
        self.b_delete_row = QtWidgets.QPushButton("顾客表")
        self.b_add_row = QtWidgets.QPushButton("商店表")
        self.b_update = QtWidgets.QPushButton('出货表')
        self.b_search = QtWidgets.QPushButton('进货表')

        # 添加按钮到按钮组中
        self.group_box_layout.addWidget(self.b_show_gys)
        self.group_box_layout.addWidget(self.b_show_wp)
        self.group_box_layout.addWidget(self.b_show_ch)
        self.group_box_layout.addWidget(self.b_delete_row)
        self.group_box_layout.addWidget(self.b_add_row)
        self.group_box_layout.addWidget(self.b_update)
        self.group_box_layout.addWidget(self.b_search)

        # 添加触发事件
        self.b_show_wp.clicked.connect(self.show_data)
        self.b_show_gys.clicked.connect(self.show_data)
        self.b_show_ch.clicked.connect(self.show_data)
        self.b_delete_row.clicked.connect(self.show_data)
        self.b_add_row.clicked.connect(self.show_data)
        self.b_update.clicked.connect(self.show_data)
        self.b_search.clicked.connect(self.show_data)

        # 设置UI界面的核心部件
        self.setCentralWidget(self.widget)

        # 设置窗口背景
        window_pale = QPalette()
        window_pale.setBrush(self.backgroundRole(), QBrush(QPixmap("新世纪百货.jpg")))
        self.setPalette(window_pale)

        self.table_widget.horizontalHeader().setStretchLastSection(True)
        self.table_widget.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)

    def show_data(self):
        sender = self.sender()
        model = QtGui.QStandardItemModel()
        cursor = self.conn.cursor()
        if sender.text() == '供应商表':
            model.setHorizontalHeaderLabels(['供货商代码', '供货商名称'])
            sql = cursor.execute('select * from sp')
            data = cursor.fetchall()
            m = 0
            for row in data:
                n = 0
                for item in row:
                    model.setItem(m, n, QtGui.QStandardItem(str(item)))
                    n += 1
                m += 1
            self.table_widget.setModel(model)
        elif sender.text() == '产品表':
            model.setHorizontalHeaderLabels(['产品编号', '产品名称', '品牌编号','品牌名称','产品类别','生产日期','售价','进价'])
            sql = cursor.execute('select * from pc')
            data = cursor.fetchall()
            m = 0
            for row in data:
                n = 0
                for item in row:
                    model.setItem(m, n, QtGui.QStandardItem(str(item)))
                    n += 1
                m += 1
            self.table_widget.setModel(model)
        elif sender.text() == '出货表':
            model.setHorizontalHeaderLabels(['销售订单代码', '销售订单时间', '产品代码', '产品名称', '产品类别','销售数目','商店代码','商店名称','商店地址','顾客代码','顾客名称','顾客姓名','销售单价','销售总价'])
            sql = cursor.execute('select * from ord')
            data = cursor.fetchall()
            m = 0
            for row in data:
                n = 0
                for item in row:
                    model.setItem(m, n, QtGui.QStandardItem(str(item)))
                    n += 1
                m += 1
            self.table_widget.setModel(model)
        elif sender.text() == '品牌表':
            model.setHorizontalHeaderLabels(['品牌代码','品牌名称'])
            sql = cursor.execute('select * from bnd')
            data = cursor.fetchall()
            m = 0
            for row in data:
                n = 0
                for item in row:
                    model.setItem(m, n, QtGui.QStandardItem(str(item)))
                    n += 1
                m += 1
            self.table_widget.setModel(model)
        elif sender.text() == '顾客表':
            model.setHorizontalHeaderLabels(['顾客代码','顾客名称','顾客性别'])
            sql = cursor.execute('select * from com')
            data = cursor.fetchall()
            m = 0
            for row in data:
                n = 0
                for item in row:
                    model.setItem(m, n, QtGui.QStandardItem(str(item)))
                    n += 1
                m += 1
            self.table_widget.setModel(model)
        elif sender.text() == '商店表':
            model.setHorizontalHeaderLabels(['商店代码','企业代码','商店名称','商店地址'])
            sql = cursor.execute('select * from st')
            data = cursor.fetchall()
            m = 0
            for row in data:
                n = 0
                for item in row:
                    model.setItem(m, n, QtGui.QStandardItem(str(item)))
                    n += 1
                m += 1
            self.table_widget.setModel(model)
        elif sender.text() == '进货表':
            model.setHorizontalHeaderLabels(['进货订单代码', '进货时间', '供应商代码', '供应商名称', '商店代码','商店名称','商店地址','产品代码','产品名称','产品类型','进货数量','进货单价','进货总价'])
            sql = cursor.execute('select * from spy')
            data = cursor.fetchall()
            m = 0
            for row in data:
                n = 0
                for item in row:
                    model.setItem(m, n, QtGui.QStandardItem(str(item)))
                    n += 1
                m += 1
            self.table_widget.setModel(model)



    def closeEvent(self, event):
        mb = QMessageBox.question(self, '系统提示', '是否关闭窗口', QMessageBox.Yes | QMessageBox.No, QMessageBox.Yes)
        if mb == QMessageBox.Yes:
            event.accept()
        else:
            event.ignore()
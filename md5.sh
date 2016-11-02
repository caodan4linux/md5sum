#!/bin/bash  
# program��
#	Calculate the current folder all the files MD5 value.
# History:
# 2016/10/28	Shang Yexin		First release

function ergodic(){  
        for file in ` ls $1 `  
        do  
                if [ -d $1"/"$file ]  
                then  
                        ergodic $1"/"$file  
                else  
                        md5sum $1"/"$file | sed "s#$INIT_PATH/##" >> $RECORDFILE
                fi  
        done  
}

#��������ļ���
RECORDFILE=check.md5
#���������ɾ������ֹ�ظ����нű�ʱ׷�ӵ���¼�ļ�
test -e $RECORDFILE && rm $RECORDFILE
#��ȡ��ǰĿ¼
INIT_PATH=`pwd`
#���������ļ�
ergodic $INIT_PATH
#���ļ�������������
sort -t ' ' -k 2 $RECORDFILE -o $RECORDFILE

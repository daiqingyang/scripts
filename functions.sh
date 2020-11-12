function insert {
    if [ $# -lt 2 ];then
        echo "need 2 args"
    fi
    file=$1
    content=$2
    if [ ! -e $file ];then
        echo "$file does not exist"
        exit 1
    fi
    #文件存在不为空
    if [ -s $file ];then
        if ! grep "$content" $file;then
            sed -i "\$a\$content" $file
        else
            echo "$content exists in $file"
        fi
    else
        echo "$content" >$file
    fi
}

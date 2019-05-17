def makeHeap(data,n)
    max = (n - 1) / 2
    if n != data.length - 1
        max = 0 # 初回以外は最初のノード以外のチェックは不要
    end
    (max).downto(0) do |i|
        k = i #kが親ノード
        while k * 2 + 2 <= n + 1 #葉がなくなるまでループ
            if k * 2 + 2 == n + 1 # 右側に子ノードないとき
                if data[k*2+1] > data[k]
                    data[k],data[k*2+1] = data[k*2+1],data[k]
                end
                break #さらに子ノードがあるわけないのでbreak
            else
                if data[k*2+1] > data[k*2+2]
                    if data[k*2+1] > data[k]
                        data[k],data[k*2+1] = data[k*2+1],data[k]
                    else
                        break
                    end
                    k = k * 2 + 1 # 新たな親ノード
                else
                    if data[k*2+2] > data[k]
                        data[k],data[k*2+2] = data[k*2+2],data[k]
                    else
                        break
                    end
                    k = k * 2 + 2 # 新たな親ノード
                end
            end
        end
    end
    return data
end

#入れ替え関数
def swap(data,from,to)
    data[from],data[to] = data[to],data[from]
end

#配列出力関数
def printArray(data)
    print "["
    data.each do |x|
        print sprintf("%3d ",x)
    end
    print "]\n"
end

data = [17,-1,13,3,7,6,21,4,3,18,3,14] #ソートする配列


(data.length-1).downto(1) do |i|
    makeHeap(data,i) #ヒープをつくる
    print " 0～#{sprintf("%2d",i)}のヒープ構築："
    printArray(data)
    swap(data,0,i) #先頭と交換
    print "交換　#{sprintf("%2d",i)}をヒープへ："
    printArray(data)
end

print "最終結果："
printArray(data)

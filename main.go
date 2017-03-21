package main

import (
	"fmt"

	"encoding/json"

	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

type Cat struct {
	Id       int
	Fid      int
	Name     string
	Children []*Cat `orm:"-"`
}

func main() {
	var o = orm.NewOrm()
	var list []*Cat
	o.QueryTable("cat").All(&list)
	tree := tree(list)
	fmt.Println(tree)
}
func init() {
	orm.RegisterDataBase("default", "mysql", "root:leozim?@/learn?charset=utf8")
	orm.RegisterModel(new(Cat))
}

func tree(list []*Cat) string {
	data := buildData(list)
	result := makeTreeCore(0, data)
	body, err := json.Marshal(result)
	if err != nil {
		fmt.Println(err)
	}
	return string(body)
}

func buildData(list []*Cat) map[int]map[int]*Cat {
	var data map[int]map[int]*Cat = make(map[int]map[int]*Cat)
	for _, v := range list {
		id := v.Id
		fid := v.Fid
		if _, ok := data[fid]; !ok {
			data[fid] = make(map[int]*Cat)
		}
		data[fid][id] = v
	}
	return data
}

func makeTreeCore(index int, data map[int]map[int]*Cat) []*Cat {
	tmp := make([]*Cat, 0)
	for id, item := range data[index] {
		if data[id] != nil {
			item.Children = makeTreeCore(id, data)
		}
		tmp = append(tmp, item)
	}
	return tmp
}

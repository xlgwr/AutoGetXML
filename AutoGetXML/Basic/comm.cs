using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Xml;

namespace AutoGetXML.Basic
{
    public class comm
    {
        /// <summary>
        /// 设置相应属性的值
        /// </summary>
        /// <param name="entity">实体</param>
        /// <param name="fieldName">属性名</param>
        /// <param name="fieldValue">属性值</param>
        public static void SetValue<T>(T entity, string fieldName, string fieldValue)
        {
            Type entityType = entity.GetType();

            PropertyInfo propertyInfo = entityType.GetProperty(fieldName);


            if (IsType(propertyInfo.PropertyType, "System.String"))
            {
                propertyInfo.SetValue(entity, fieldValue, null);

            }
            else if (IsType(propertyInfo.PropertyType, "System.Boolean"))
            {
                propertyInfo.SetValue(entity, Boolean.Parse(fieldValue), null);

            }
            else if (IsType(propertyInfo.PropertyType, "System.Int32"))
            {
                if (fieldValue != "")
                    propertyInfo.SetValue(entity, int.Parse(fieldValue), null);
                else
                    propertyInfo.SetValue(entity, 0, null);

            }
            else if (IsType(propertyInfo.PropertyType, "System.Decimal"))
            {
                if (fieldValue != "")
                    propertyInfo.SetValue(entity, Decimal.Parse(fieldValue), null);
                else
                    propertyInfo.SetValue(entity, new Decimal(0), null);

            }
            else if (IsType(propertyInfo.PropertyType, "System.Nullable`1[System.DateTime]"))
            {
                if (fieldValue != "")
                {
                    try
                    {
                        propertyInfo.SetValue(
                            entity,
                            (DateTime?)DateTime.ParseExact(fieldValue, "yyyy-MM-dd HH:mm:ss", null), null);
                    }
                    catch
                    {
                        propertyInfo.SetValue(entity, (DateTime?)DateTime.ParseExact(fieldValue, "yyyy-MM-dd", null), null);
                    }
                }
                else
                    propertyInfo.SetValue(entity, null, null);

            }

        }

        public List<string> allProperty<T>(T tobj)
        {
            var tmplist = new List<string>();

            Type type = tobj.GetType();
            System.Reflection.PropertyInfo[] ps = type.GetProperties();
            foreach (PropertyInfo i in ps)
            {
                tmplist.Add(i.Name);
            }
            return tmplist;
        }
        public static T setXmlElementToT<T>(T tobj, XmlElement xe)
        {
            Type type = tobj.GetType();
            System.Reflection.PropertyInfo[] ps = type.GetProperties();
            foreach (PropertyInfo i in ps)
            {
                var xeValueForName = xe.GetElementsByTagName(i.Name).Item(0).InnerText.Replace("\n\r", "").Trim();
                SetValue<T>(tobj, i.Name, xeValueForName);
            }
            return tobj;
        }
        public static string GetValue<T>(T t, string propertyname)
        {
            Type type = typeof(T);

            PropertyInfo property = type.GetProperty(propertyname);

            if (property == null) return string.Empty;

            object o = property.GetValue(t, null);

            if (o == null) return string.Empty;

            return o.ToString();
        }

        /// <summary>
        /// 类型匹配
        /// </summary>
        /// <param name="type"></param>
        /// <param name="typeName"></param>
        /// <returns></returns>
        public static bool IsType(Type type, string typeName)
        {
            if (type.ToString() == typeName)
                return true;
            if (type.ToString() == "System.Object")
                return false;

            return IsType(type.BaseType, typeName);
        }
    }
}

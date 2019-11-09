export function validUsername(str) {
    const valid_map = ['admin','editor','haha1','haha52',"haha51"]
    return valid_map.indexOf(str.trim()) >= 0;
}

export function isExternal(path){
    return /^(https?:|mailto:|tel:)/.test(path);
}


export function validatEmail(str) {
  const reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/
  return reg.test(str)
}

// 手机号验证
export function isvalidPhone(str) {

  const reg = /^1[3|4|5|7|8][0-9]\d{8}$/
  return reg.test(str)
}

// 不能输入中文
export function isvalidChinaese(str) {
  const reg = /^[a-zA-Z0-9_]+$/g
  return reg.test(str)
}


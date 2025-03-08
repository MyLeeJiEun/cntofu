import os
import re
from pathlib import Path

def replace_in_files(folder_path, old_str, new_str, file_ext=".html"):
    """
    递归替换文件夹及其子文件夹中指定类型文件的内容
    :param folder_path: 要处理的根目录
    :param old_str: 需要被替换的字符串（正则表达式）
    :param new_str: 替换后的字符串
    :param file_ext: 需要处理的文件扩展名
    """
    modified_count = 0
    
    # 遍历所有子目录和文件
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            if file.endswith(file_ext):
                file_path = Path(root) / file
                
                try:
                    # 读取文件内容（自动检测编码）
                    with open(file_path, 'r', encoding='utf-8') as f:
                        content = f.read()
                    
                    # 执行替换（使用正则表达式精确匹配）
                    new_content = re.sub(
                        re.escape(old_str),  # 自动转义特殊字符
                        new_str,
                        content
                    )
                    
                    # 如果内容有变化则写入文件
                    if new_content != content:
                        with open(file_path, 'w', encoding='utf-8') as f:
                            f.write(new_content)
                        modified_count += 1
                        print(f'已修改: {file_path}')
                        
                except UnicodeDecodeError:
                    print(f'⚠️ 跳过非文本文件: {file_path}')
                except Exception as e:
                    print(f'处理 {file_path} 时出错: {str(e)}')

    print(f'\n完成！共修改了 {modified_count} 个文件')

if __name__ == "__main__":
    # 使用示例
    target_folder = os.getcwd()  # 当前工作目录
    replace_in_files(
        folder_path=target_folder,
        old_str=".markdown",     # 需要替换的文本
        new_str=".html",         # 替换后的文本
        file_ext=".html"         # 要处理的文件类型
    )
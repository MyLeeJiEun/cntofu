from pathlib import Path

def rename_md_to_html():
    # 获取当前目录
    current_dir = Path.cwd()
    
    # 遍历所有子目录中的.md文件
    for md_file in current_dir.rglob('*.markdown'):
        # 构建新的.html路径
        html_file = md_file.with_suffix('.html')
        
        # 如果目标文件已存在则跳过
        if html_file.exists():
            print(f"⚠️ 文件已存在，跳过: {html_file}")
            continue
        
        # 执行重命名操作
        md_file.rename(html_file)
        print(f"✅ 重命名成功: {md_file} -> {html_file}")

if __name__ == "__main__":
    rename_md_to_html()

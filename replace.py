from pathlib import Path

def process_md_files():
    current_dir = Path.cwd()
    
    for md_file in current_dir.rglob('*.md'):
        # 第一步：替换文件内容
        try:
            # 读取文件内容（使用UTF-8编码）
            content = md_file.read_text(encoding='utf-8')
            # 执行字符串替换
            updated_content = content.replace('.markdown', '.html')
            # 写回修改后的内容
            md_file.write_text(updated_content, encoding='utf-8')
        except UnicodeDecodeError:
            print(f"❌ 解码失败：{md_file}（请检查文件编码）")
            continue
        except Exception as e:
            print(f"❌ 内容替换失败：{md_file} - {str(e)}")
            continue

        # 第二步：重命名文件
        html_file = md_file.with_suffix('.html')
        if html_file.exists():
            print(f"⚠️ 跳过已存在文件：{html_file}")
            continue
            
        try:
            md_file.rename(html_file)
            print(f"✅ 完成：{md_file.name} -> {html_file.name}")
        except Exception as e:
            print(f"❌ 重命名失败：{md_file} - {str(e)}")

if __name__ == "__main__":
    process_md_files()

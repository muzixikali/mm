import os

def removeTypeFiles(fileTypes):
    """删除指定后缀名的文件"""
    for fileType in fileTypes:
        for file in os.listdir():
            if fileType in file:
                os.remove(file)
                print(f"已删除{file}")
                
if __name__ == "__main__":
    fileTypes = [".aux",".log",".out",".gz",".toc"]
    removeTypeFiles(fileTypes)
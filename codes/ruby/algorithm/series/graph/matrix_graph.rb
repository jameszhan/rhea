# encoding: UTF-8
require 'matrix'

#We don't use open class
class MutableMatrix < Matrix
  def []=(i, j, v)
    @rows[i][j] = v
  end
end

class MatrixGraph
  INFINITY = 2 ** 16
  Edge = Struct.new(:start, :stop, :weight) do
    def inspect
      "(#{start}, #{stop}, #{weight})"
    end
  end
  
  def initialize(vertexs, *rows, &block)
    @vertexs = vertexs
    if rows.any?
      @matrix = MutableMatrix.rows(rows)
    else
      @matrix = MutableMatrix.build(vertexs.size){ INFINITY }
    end    
    instance_eval(&block) if block_given?
  end
  
  def vertex(index)
    @vertexs[index]
  end
  
  def [](start, stop)
    @matrix[@vertexs.index(start), @vertexs.index(stop)]
  end
  
  def vertex_size
    @vertexs.size    
  end
  
  def edges
    @matrix
  end
  
  def to_s
    ret = " \t#{@vertexs.join("\t")}\n\n"
    (0...edges.row_count).each do |i|
      row = edges.row(i).map do|e|
        e == INFINITY ? "∽" : e          
      end
      ret<< "#{@vertexs[i]}\t#{row.to_a.join("\t")}\n\n"
    end
    ret
  end
  
  def bfs_travel(&block)
    visited = Array.new(vertex_size, false)
    (0...vertex_size).each do|i|
      bfs(visited, i, &block) unless visited[i]
    end
  end
  
  def dfs_travel(&block)
    visited = Array.new(vertex_size, false)
    (0...vertex_size).each do|i|
      dfs(visited, i, &block) unless visited[i]
    end
  end
  
  
  # 最小生成树
  # 1. 概念
  #   对于一个连通图G，如果其全部顶点和一部分边构成一个子图G1，当G1满足：
  #     ① 刚好将图中所有顶点连通。②顶点不存在回路。则称G1就是G的“生成树”。 其实一句话总结就是：生成树是将原图的全部顶点以最小的边连通的子图。
  #     ② 对于一个带权的连通图，当生成的树不同，各边上的权值总和也不同，如果某个生成树的权值最小，则它就是“最小生成树”。
  # 2. 场景
  #   实际应用中“最小生成树”还是蛮有实际价值的，若用图来表示一个交通系统，每一个顶点代表一个城市，边代表两个城市之间的距离，当有n个城市时，可能会有n(n-1)/2条边，那么怎么选择(n-1)条边来使城市之间的总距离最小，其实它的抽象模型就是求“最小生成树”的问题。
  # 3. prim算法
  #   描述:
  #     从单一顶点开始，普里姆算法按照以下步骤逐步扩大树中所含顶点的数目，直到遍及连通图的所有顶点。
  #     => 输入：一个加权连通图，其中顶点集合为V，边集合为E；
  #     => 初始化：Vnew = {x}，其中x为集合V中的任一节点（起始点），Enew = {}；
  #     => 重复下列操作，直到Vnew = V：
  #     => 在集合E中选取权值最小的边（u, v），其中u为集合Vnew中的元素，而v则不是（如果存在有多条满足前述条件即具有相同权值的边，则可任意选取其中之一）；
  #     => 将v加入集合Vnew中，将（u, v）加入集合Enew中；
  #     => 输出：使用集合Vnew和Enew来描述所得到的最小生成树。
  #   证明：
  #     => 设prim生成的树为G0
  #     => 假设存在Gmin使得cost(Gmin)<cost(G0)
  #     => 则在Gmin中存在(u,v)不属于G0
  #     => 将(u,v)加入G0中可得一个环，且(u,v)不是该环的最长边
  #     => 这与prim每次生成最短边矛盾
  #     => 故假设不成立，得证.
  # PRIM(G, w, s)
  # 1  Q ← V[G]
  # 2  for each u ∈ Q
  # 3    do key[u] ← ∞
  # 4  key[r] ← 0
  # 5  π[r] ← NIL
  # 6  while Q ≠ Ø
  # 5    do u ← EXTRACT-MIN(Q)
  # 6      for each v ∈ Adj[u]
  # 7        do if v ∈ Q and w(u, v) < key[v]
  # 8          then π[r] ← u
  # 9            key[v] ← w(u, v)
  def prim()    
    extract_min = ->(u, e, n){
      index, min = -1, INFINITY
      (1...n).each do|i|
        if !u[i] && e[i].weight <= min # Fix non-connected graph 
          index, min = i, e[i].weight
        end
      end
      index
    }
    u, e, sum = Array.new(vertex_size, false), Array.new(vertex_size), 0 
    #默认选择0号节点加入生成树，并初始化【0，1】，【0，2】，。。。【0，n-1】权重    
    u[0] = true
    (1...vertex_size).each do|i|
      #最短距离初始化为其他节点到1号节点的距离, 标记所有节点的起点皆为默认的0号节点
      e[i] = Edge.new(0, i, edges[0, i])
    end   
    
    #n个节点至少需要n-1条边构成最小生成树    
    (1...vertex_size).each do|i|
      index = extract_min.(u, e, vertex_size)    
        
      yield vertex(e[index].start), vertex(e[index].stop), e[index].weight if block_given?
      sum += e[index].weight
      u[index] = true
      
      #更新当前节点index到其他节点的权值
      (1...vertex_size).each do|j|
        #发现更小的权值
        if edges[index, j] < e[j].weight # && index != j && !u[j]
          e[j] = Edge.new(index, j, edges[index, j])
        end
      end
    end
    sum
  end
   
  # DIJKSTRA(G, w, s)
  # 1  INITIALIZE-SINGLE-SOURCE(G, s)       
  # 2  S ← Ø
  # 3  Q ← V[G]                             
  # 4  while Q ≠ Ø
  # 5    do u ← EXTRACT-MIN(Q)              
  # 6      S ← S ∪ {u}
  # 7      for each vertex v ∈ Adj[u]
  # 8        do RELAX(u, v, w)              
  def dijks(s)
    init_single_source = ->(d, s){
      (0...d.size).each do|i|
        d[i] = edges[s, i], [s, i]
      end
      d
    }
    u, d = Array.new(vertex_size, false), init_single_source.(Array.new(vertex_size, 0), s)  
    start = s
    (0...vertex_size).each do|i|
      u[start] = true
      (0...vertex_size).each do|j|
        weight = edges[start, j]
        if weight < d[j].first
          total_weight = (d[start].first == INFINITY) ? weight : d[start].first + weight
          if total_weight < d[j].first
            d[j] = total_weight, d[start].last | [j]
          end
        end
      end
      
      index, min = 0, INFINITY
           
      (0...vertex_size).each do|j|
        if !u[j] && d[j].first < min
          index, min = j, d[j].first
        end
      end
      start = index    
    end  
    d
  end
  
  def dijkstra()
    init_single_source = ->(d){
      (0...d.size).each do|i|
        d[i] = edges[0, i], [0, i]
      end
      d
    }
    u, d = Array.new(vertex_size, false), init_single_source.(Array.new(vertex_size, 0))  
    start = 0  
    (0...vertex_size).each do|i|
      u[start] = true
      (0...vertex_size).each do|j|
        weight = edges[start, j]
        if weight < d[j].first
          total_weight = (d[start].first == INFINITY) ? weight : d[start].first + weight
          if total_weight < d[j].first
            d[j] = total_weight, d[start].last | [j]
          end
        end
      end
      
      index, min = 0, INFINITY
           
      (0...vertex_size).each do|j|
        if !u[j] && d[j].first < min
          index, min = j, d[j].first
        end
      end
      start = index    
    end  
    d  
  end
  
  private 
    def diagonal!(*values)
      (0...@matrix.row_count).each do|i|
        @matrix[i, i] = values[i] || values.last
      end
    end
    
    def symmetric!
      @matrix.each_with_index do|v, r, c|
        @matrix[c, r] = v unless v == INFINITY
      end
    end
    
    def []=(start, stop, v)
      @matrix[@vertexs.index(start), @vertexs.index(stop)] = v
    end
    
    def bfs(visited, vertex_index, &block)
      queue = Array.new
      queue.push(vertex_index) #enqueue      
      block.call(@vertexs[vertex_index])
      visited[vertex_index] = true
      
      while(queue.size > 0)
        tmp = queue.shift #dequeue
        (0...vertex_size).each do|i|
          if !visited[i] && edges[tmp, i] != INFINITY
            visited[i] = true
            queue.push(i)
            block.call(@vertexs[i])
          end
        end
      end
    end
    
    def dfs(visited, vertex_index, &block)
      block.call(@vertexs[vertex_index])
      visited[vertex_index] = true
      (0...vertex_size).each do|i|
        if !visited[i] && edges[vertex_index, i] != INFINITY
          dfs(visited, i, &block)
        end
      end
    end
          
end



if __FILE__ == $0
  graph = MatrixGraph.new(["A", "B", "C", "D", "E", "F", "G"]) do |graph|
    self["A", "B"] = 7
    self["A", "D"] = 5
    self["B", "C"] = 8
    self["B", "D"] = 9
    self["B", "E"] = 7
    self["C", "E"] = 5
    self["D", "E"] = 15
    self["D", "F"] = 6
    self["E", "F"] = 8
    self["E", "G"] = 9
    self["F", "G"] = 11

    symmetric!
    diagonal!(0)
  end

=begin 
  graph = MatrixGraph.new(["A", "B", "C", "D", "E"]) do |graph|
    edges[0, 1] = 1
    edges[0, 2] = 20
    edges[0, 3] = 19
    edges[1, 2] = 2
    edges[1, 3] = 18
    edges[1, 4] = 17
    edges[2, 3] = 3
    edges[2, 4] = 16
    edges[3, 4] = 5

    symmetric!
    diagonal!(0)
  end

  graph = MatrixGraph.new(["A", "B", "C", "D", "E", "F", "G"]) do |graph|

    edges[5, 6] = 1
    edges[4, 5] = 4
    edges[0, 4] = 5
    edges[0, 3] = 6
    edges[3, 2] = 2
    edges[2, 1] = 1
  
    symmetric!
    diagonal!(0)
  end
=end
  
  puts graph
  
  graph.bfs_travel do|vertex|
    print "#{vertex} -> "
  end
  puts ""
  
  graph.dfs_travel do|vertex|
    print "#{vertex} -> "
  end
  puts ""
  
  #p graph.prim {|start, last, weight| puts "#{graph.vertex(start)} -> #{graph.vertex(last)}:#{weight}"}
  p graph.prim {|start, stop, weight| p "#{start}->#{stop} : #{weight}"}
  
  p graph.dijkstra
  p graph.dijks(0)
  p graph.dijks(1)
  p graph.dijks(2)
  p graph.dijks(3)
  p graph.dijks(4)
  p graph.dijks(5)
end
